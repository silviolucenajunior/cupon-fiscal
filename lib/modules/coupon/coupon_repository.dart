import './models/coupon_model.dart';

class ICouponRepository {
  void save(Coupon coupon) {
  }

  List getAll() {
    return List();
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