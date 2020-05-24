import 'package:flutter/material.dart';

class CouponItemWidget extends StatelessWidget {
  const CouponItemWidget({
    Key key,
    this.color,
  }) : super(key: key);
  
  final color;
  
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
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CouponItemWidget._getQuantidadeWidget(),
              CouponItemWidget._getProdutoWidget(),
              CouponItemWidget._getUnitPriceWidget(),
              CouponItemWidget._getTotalPriceWidget(),
            ]
          )
        ),
      ),
    );
  }
  
  static Widget _getQuantidadeWidget() {
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
          "10",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          )
        )
      ]
    );
  }
  
  static Widget _getProdutoWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Bolacha Recheadasss",
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        )
      ),
    );
  }
  
  static Widget _getUnitPriceWidget () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          "Unt.",
          style: TextStyle(
            fontSize: 10,
            color: Colors.black,
          )
        ),
        Text(
          r"R$ 2,50",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          )
        )
      ]
    );
  }
  
  static Widget _getTotalPriceWidget () {
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
          r"R$ 25,0 0",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}