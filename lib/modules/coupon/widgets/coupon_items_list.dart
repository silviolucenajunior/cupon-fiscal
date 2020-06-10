import 'package:flutter/material.dart';
import '../models/coupon_item_model.dart';

class CouponItemWidget extends StatelessWidget {
  const CouponItemWidget({
    Key key,
    this.color,
    this.item
  }) : super(key: key);
  
  final color;
  final CouponItem item;
  
  @override
  Widget build(BuildContext context) {
    return Material (
      color: this.color,
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white30,
        onTap: () {
          print("Tap");
        },
        child: Container(
          width: 600,
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getQuantidadeWidget(),
              _getProdutoWidget(),
              _getTotalPriceWidget(),
            ]
          )
        ),
      ),
    );
  }
  
  Widget _getQuantidadeWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Qnt.",
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
          )
        ),
        Text(
          item.amount.toString(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          )
        )
      ]
    );
  }
  
  Widget _getProdutoWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        item.description,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        )
      ),
    );
  }
  
  Widget _getTotalPriceWidget () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Total",
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
          )
        ),
        Text(
          r"R$ " + (item.getTotalPrice() / 100).toString(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}