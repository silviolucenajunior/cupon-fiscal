import './coupon_item_model.dart';

class Coupon {
  int id;
  String city;
  String state;
  String neighborhood;
  String address;
  String stablishmentName;
  String buyDate;
  List<CouponItem> items;

  Coupon({
    this.stablishmentName, 
    this.buyDate, 
    this.items,
    this.city,
    this.state,
    this.neighborhood,
    this.address
  });

  List<CouponItem> getItem() {
    return this.items;
  }

  int getTotalPrice() {
    int amount = 0;
    items.forEach( (item) {
      amount += item.getTotalPrice();
    });

    return amount;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> couponAsMap = {
      'stablishmentName': this.stablishmentName, 
      'buyed_at': this.buyDate, 
      // 'items': this.items,
      'city': this.city,
      'state': this.state,
      'neighborhood': this.neighborhood,
      'address': this.address
    };

    return couponAsMap;
  }
}