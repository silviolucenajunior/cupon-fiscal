import './coupon_item_model.dart';

class Coupon {
  String fantasyName;
  String buyDate;
  List<CouponItem> items;

  Coupon(this.fantasyName, this.buyDate, this.items);
}