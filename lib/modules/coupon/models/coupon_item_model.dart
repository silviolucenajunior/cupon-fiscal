class CouponItem {
  int price;
  double amount;
  String description;

  CouponItem(this.price, this.amount, this.description);

  int getTotalPrice() {
    int total = (amount * price).toInt();

    return total;
  }
}