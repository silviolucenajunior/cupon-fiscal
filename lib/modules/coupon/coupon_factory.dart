import './models/coupon_item_model.dart';
import './models/coupon_model.dart';

class CouponFactory {

  static Coupon fromJson(Map<String, dynamic> json) {
    List<CouponItem> items = CouponFactory._getItemsFromJson(json);
    return Coupon(json['fantasyName'], json['taxpayerObservation'], items);
  }

  static List<CouponItem> _getItemsFromJson(Map<String, dynamic>  json) {
    List<CouponItem> list = List<CouponItem>();
    json['items'].forEach( (jsonItem) {
      CouponItem coupon =  CouponItem((jsonItem['price'] * 100).round(), jsonItem['amount'], jsonItem['description']);
      list.add(coupon);
    });

    return list;
  }
}