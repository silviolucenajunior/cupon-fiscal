import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import '../coupon_services.dart';
import '../models/coupon_model.dart';

class CouponQRScanner extends StatefulWidget {
  final ICouponService couponService;

  CouponQRScanner({Key key, this.couponService}) : super(key :key);

  @override
  _CouponQRScannerState createState() => _CouponQRScannerState();
}

class _CouponQRScannerState extends State<CouponQRScanner> {
  bool scanning = false;

  @override
  Widget build( BuildContext context ) {
    return Container(
      child: Column(
        children: <Widget>[
          this._getScannerPreviewWidget(),
          SizedBox(height: 10),
          this._getScannerActions()
        ],
      ),
    );
  }

  Widget _getScannerPreviewWidget() {
    return 
    this.scanning 
    ? 
      Container(
        width: 320,
        height: 320,
        child: QrCamera(
          onError: (context, error) => Text(
            error.toString(),
            style: TextStyle(color: Colors.red),
          ),
          qrCodeCallback: (code) {
            String couponCode = this._extractCouponCodeFromQRCode(code);
            Coupon coupon = this.widget.couponService.getCouponInformationByCouponCode(couponCode);
            this._redirectToCouponDetail(coupon);
          },
        ),
      )
    :
      Container(
        width: 320,
        height: 320,
        color: Colors.green
      );
  }

  String _extractCouponCodeFromQRCode(String code) {
    return code.split("|")[0];
  }

  void _redirectToCouponDetail(Coupon coupon) {
    //TODO
  }

  Widget _getScannerActions () {
    return Row(
        children: [
          RaisedButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            this.setState( () => {
              this.scanning = !this.scanning
            });
            print(this.scanning);
            print("Bo");
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
        )
      ]
    );
  }
}