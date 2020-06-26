import './models/coupon_model.dart';
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
    print(this.itemList.length);
  }

  @override
  List getAll() {
    print(this.itemList.length);
    return itemList;
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
  void _saveCouponItems(coupon) {
    //TODO implement latter.
  }

  @override
  Future<List<Coupon>> getAll() async {
    final connection = await this.database.getDatabase();

    final List<Map<String, dynamic>> maps = connection.query('coupons');
    return Future<List<Coupon>>(() {
      return List<Coupon>.generate(
        maps.length,
        ( index ) {
          return CouponFactory.fromJson(maps[index]);
        }
      );
    });
    
  }

}