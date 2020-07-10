import './models/coupon_model.dart';
import './models/coupon_item_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../core/database.dart';
import './coupon_factory.dart';

class ICouponRepository {
  void save(Coupon coupon) {
  }

  Future<List> getAll() {
    return Future( () => List());
  }
}

class InMemoryCouponRepository extends ICouponRepository {
  List<Coupon> itemList = [];

  @override
  void save(Coupon coupon) {
    this.itemList.add(coupon);
  }

  @override
  Future<List> getAll() {
    return Future( () => itemList );
  }
}

class LocalStorageRepository extends ICouponRepository {
  IDatabase database;

  LocalStorageRepository(this.database);

  @override
  void save(Coupon coupon) {
    this._saveCoupon(coupon);
    this._saveCouponItems(coupon);
  }

  void _saveCoupon(coupon) async {
    final connection = await this.database.getDatabase();
    await connection.insert(
      'coupon',
      coupon.toMap()
    );
  }
  void _saveCouponItems(coupon) async {
    final connection = await this.database.getDatabase();
    List<CouponItem> itemsToSave = coupon.getItems();
  }

  @override
  Future<List<Coupon>> getAll() async {
    final connection = await this.database.getDatabase();
    List<Coupon> list = List<Coupon>();

    final List<Map<String, dynamic>> result = await connection.query('coupon');
    result.forEach( (Map<dynamic, dynamic> coupon) {
      list.add(CouponFactory.fromJson(coupon));
    });

    return Future<List<Coupon>>( () => list );
  }

}