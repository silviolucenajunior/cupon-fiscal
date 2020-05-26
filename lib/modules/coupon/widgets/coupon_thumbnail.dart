import 'package:flutter/material.dart';
import '../models/coupon_model.dart';

class CouponThumbnailWidget extends StatelessWidget {
  Coupon coupon;

  CouponThumbnailWidget({Key key, this.coupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     width: 600,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         _getDateWidget(),
    //         _getPriceWidget(),
    //         _getStablishmentWidget(),
    //       ]
    //     )
    //   )
    // );
    return Container(
        padding: EdgeInsets.all(10),
        width: 600,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _getDateWidget(),
            _getPriceWidget(),
            _getStablishmentWidget(),
          ]
        )
    );
  }
  
  Widget _getStablishmentWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          coupon.stablishmentName,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        Text(coupon.address,
            style: TextStyle(
            fontSize: 12,
          ),),
        Text(coupon.city + "/" + coupon.state,
            style: TextStyle(
            fontSize: 12,
          ),),
      ]
    );
  }
  
  Widget _getDateWidget() {
    return Text(
      coupon.buyDate,
      style: TextStyle(
        fontSize: 12
      )
    );
  }
  
  Widget _getPriceWidget() {
    return Text(
      r"R$ " + coupon.getTotalPrice().toString(),
      style: TextStyle(
        fontSize: 12
      )
    );
  }
}
