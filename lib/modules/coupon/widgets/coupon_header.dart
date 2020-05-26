import 'package:flutter/material.dart';
import '../models/coupon_model.dart';

class CouponHeaderWidget extends StatelessWidget {
  final Coupon coupon;

  CouponHeaderWidget({Key key, this.coupon}) : super(key: key);

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
  
  Widget _getCardContent() {
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
             this._getCouponValueWidget(),
             this._getDateWidget(),
           ],
        ),
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.end,
           textBaseline: TextBaseline.alphabetic,
           children: <Widget>[
             this._getStablishmentWidget(),
             this._getDescriptionWidget(),
           ],
        ),
      ]
     );
  }
  
  Widget _getCouponValueWidget() {
    return Text(
      " -- R\$" + (coupon.getTotalPrice().toString()),
      style: TextStyle(
        fontSize: 32,
        color: Colors.white,
      ),
    );
  }
  
  Widget _getDateWidget() {
    return Text(
      coupon.buyDate,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
  
  Widget _getStablishmentWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coupon.stablishmentName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            coupon.address + '\n' + coupon.neighborhood + '\n' + coupon.city + '/' + coupon.state,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          )
        ]
      )
    );
  }
  
  Widget _getDescriptionWidget() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
           coupon.items.length.toString() + " Items no Carrinho",
           style: TextStyle(
             fontSize: 16,
             color: Colors.white,
           )
        )
    );
  }

}
