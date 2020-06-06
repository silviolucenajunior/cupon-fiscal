import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import '../coupon_services.dart';
import '../coupon_repository.dart';
import '../coupon_factory.dart';
import '../models/coupon_model.dart';
import './coupon_number_input_dialog.dart';

class CouponQRScanner extends StatefulWidget {
  final ICouponService couponService;
  final ICouponRepository couponRepository;

  CouponQRScanner({Key key, this.couponService, this.couponRepository}) : super(key :key);

  @override
  _CouponQRScannerState createState() => _CouponQRScannerState();
}

class _CouponQRScannerState extends State<CouponQRScanner> {
  bool scanning = false;
  bool scaned = false; //HACK is a hack to manipulate the multiple scan of used lib for qRScan

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
          notStartedBuilder: (context) {
            return Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator()
                  )
                )
              );
          },
          child: this.scaned
            ? 
              Container(
                color: Colors.white,
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator()
                  )
                )
              )
            :
              null
          ,
          qrCodeCallback: (code) async {
            if (scaned == false )  {
              setState(() => scaned = true);
              String couponCode = this._extractCouponCodeFromQRCode(code);
              Coupon coupon = await this.widget.couponService.getCouponInformationByCouponCode(couponCode) as Coupon;
              this.widget.couponRepository.save(coupon);
              setState(() {
                scaned = true;
                scanning = false;
              });
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
            showDialog(
              context: context,
              builder: (context) {
                return CouponNumberDialog();
              }
            );
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