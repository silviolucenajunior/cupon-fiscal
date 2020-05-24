import 'package:flutter/material.dart';

class CouponHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10.0),
       ),
       child: 
        Container(
          padding: EdgeInsets.all(8),
          width: 600,
          child: _getCardContent(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[300], Colors.blue[500]],
                stops: [ 0.3, 0.9],
              ),
              borderRadius: BorderRadius.circular(10.0),
          ),
      )
    );
  }
  
  static Widget _getCardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.start,
           textBaseline: TextBaseline.alphabetic,
           children: <Widget>[
             CouponHeaderWidget._getCouponValueWidget(),
             CouponHeaderWidget._getDateWidget(),
           ],
        ),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.end,
           textBaseline: TextBaseline.alphabetic,
           children: <Widget>[
             CouponHeaderWidget._getStablishmentWidget(),
             CouponHeaderWidget._getDescriptionWidget(),
           ],
        ),
      ]
     );
  }
  
  static Widget _getCouponValueWidget() {
    return Text(
      "R\$ 371,00",
      style: TextStyle(
        fontSize: 32,
        color: Colors.white,
      ),
    );
  }
  
  static Widget _getDateWidget() {
    return Text(
      "21/08/2020 às 11:30",
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
  
  static Widget _getStablishmentWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mercadinho o Zezão",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            "Av Francisco Sá, 504, \nCarlito Pamplona\nFortaleza, Ceará",
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          )
        ]
      )
    );
  }
  
  static Widget _getDescriptionWidget() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
           "31 Items no Carrinho",
           style: TextStyle(
             fontSize: 16,
             color: Colors.white,
           )
        )
    );
  }
  

}
