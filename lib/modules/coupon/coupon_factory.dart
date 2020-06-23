import 'dart:math';
import './models/coupon_item_model.dart';
import './models/coupon_model.dart';
import './models/coupon_timeserie.dart';

class CouponFactory {

  static Coupon fromJson(Map<String, dynamic> json) {
    List<CouponItem> items = CouponFactory._getItemsFromJson(json);
    return Coupon(
      stablishmentName: json['fantasyName'], 
      buyDate: json['taxpayerObservation'], 
      items: items,
      city: json['address']['city']['name'],
      neighborhood: json['address']['neighborhood'],
      state: 'Ceará',
      address: json['address']['street'] + " " + json['address']['number'],
    );
  }

  static List<CouponItem> _getItemsFromJson(Map<String, dynamic>  json) {
    List<CouponItem> list = List<CouponItem>();
    json['items'].forEach( (jsonItem) {
      CouponItem coupon =  CouponItem(jsonItem['price'], jsonItem['amount'], jsonItem['description']);
      list.add(coupon);
    });

    return list;
  }

  static Coupon generateFakeCoupon() {
    List<CouponItem> items = <CouponItem>[  generateFakeCouponItem() ];
    return Coupon(
      stablishmentName: "O Zezão", 
      buyDate: "21/08/2020", 
      items: items,
      city: 'Fortaleza',
      neighborhood: 'Carlito Pamplona',
      state: 'Ceará',
      address: 'Coelho da Fonseca 514'
      );
  }

  static CouponItem generateFakeCouponItem() {
    return CouponItem(100, 10, "Maça");
  }

  static TimeSeriesCoupon generateFakeTimeSeriesCouponList (int day) {
    DateTime date = DateTime.now();
    print(date);
    return new TimeSeriesCoupon( new Random().nextInt(130).toDouble(), date.add( Duration(days: day) ) );
  }
}