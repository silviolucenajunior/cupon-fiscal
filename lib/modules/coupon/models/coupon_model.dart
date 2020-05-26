import './coupon_item_model.dart';

class Coupon {
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

  int getTotalPrice() {
    int amount = 0;
    items.forEach( (item) {
      amount += item.price;
    });

    return amount;
  }
}