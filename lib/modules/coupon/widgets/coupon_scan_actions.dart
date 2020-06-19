import 'package:flutter/material.dart';

class CouponScanActions extends StatelessWidget {
  final commandManager;
  CouponScanActions({Key key, this.commandManager }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            this.commandManager.execute('scan');
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
          onPressed: () {
            this.commandManager.execute('digit', context);
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
            this.commandManager.execute('fake');
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