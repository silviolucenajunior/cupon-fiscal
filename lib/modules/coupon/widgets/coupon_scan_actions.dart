import 'package:flutter/material.dart';
import '../coupon_services.dart';
import '../coupon_repository.dart';
import '../coupon_factory.dart';
import '../models/coupon_model.dart';
import './coupon_number_input_dialog.dart';

class CouponScanActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
          },
          child: Column(
            children: [
              Icon(
                Icons.photo_camera
              ),
              Text(
                "Scans",
                style: TextStyle(
                  fontSize: 12
                )
              )
            ]
          )
        ),
        SizedBox(
          width: 20,
        ),
        RaisedButton(
          padding: EdgeInsets.all(10),
          onPressed: () async {
            // var codigo = await showDialog(
            //   context: context,
            //   builder: (context) {
            //     return CouponNumberDialog();
            //   }
            // );
            // this.widget.couponService.getCouponInformationByCouponCode(codigo)
            // .then( (Coupon coupon) {
            //     this.widget.couponRepository.save(coupon);
            //     setState(() {
            //       scaned = true;
            //       scanning = false;
            //     });
            //   }).catchError( (error) {
            //     setState(() {
            //       scaned = true;
            //       scanning = false;
            //     });
            //   });
          },
          child: Column(
            children: [
              Icon(
                Icons.input
              ),
              Text(
                "Digit",
                style: TextStyle(
                  fontSize: 12
                )
              )
            ]
          )
        ),
        SizedBox(
          width: 20,
        ),
        RaisedButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            // Coupon coupon = CouponFactory.generateFakeCoupon();
            // this.widget.couponRepository.save(coupon);
          },
          child: Column(
            children: [
              Icon(
                Icons.plus_one
              ),
              Text(
                "Scans",
                style: TextStyle(
                  fontSize: 12
                )
              )
            ]
          )
        )
      ]
    );
  }
}