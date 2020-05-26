import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import '../coupon_services.dart';
import '../coupon_repository.dart';
import '../coupon_factory.dart';
import '../models/coupon_model.dart';

class CouponQRScanner extends StatefulWidget {
  final ICouponService couponService;
  final ICouponRepository couponRepository;

  CouponQRScanner({Key key, this.couponService, this.couponRepository}) : super(key :key);

  @override
  _CouponQRScannerState createState() => _CouponQRScannerState();
}

class _CouponQRScannerState extends State<CouponQRScanner> {
  bool scanning = false;
  bool scaned = false; //HACK is a hack to manipulate the multiple scan of dependency

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
          qrCodeCallback: (code) async {
            if (scaned == false )  {
              scaned = true;
              String couponCode = this._extractCouponCodeFromQRCode(code);
              Coupon coupon = await this.widget.couponService.getCouponInformationByCouponCode(couponCode) as Coupon;
              this.widget.couponRepository.save(coupon);
              this._redirectToCouponDetail(coupon);
            }
          },
        ),
      )
    :
      Container(
        width: 320,
        height: 320,
        child: Icon(Icons.crop_free, size: 300, color: Colors.blue[300]),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
        ),
        SizedBox(
          width: 20,
        ),
        RaisedButton(
          padding: EdgeInsets.all(10),
          onPressed: () {
            Coupon coupon = CouponFactory.generateFakeCoupon();
            this.widget.couponRepository.save(coupon);
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