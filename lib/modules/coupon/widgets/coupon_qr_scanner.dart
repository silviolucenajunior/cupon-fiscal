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
  var state;

  CouponQRScanner({Key key, this.couponService, this.couponRepository}) : super(key :key);

  @override
  _CouponQRScannerState createState() {
    this.state = _CouponQRScannerState();

    return this.state;
  }

  void startScan() {
    this.state.startScan();
  }
}

class _CouponQRScannerState extends State<CouponQRScanner> {
  bool scanning = false;
  bool scaned = false; //HACK is a hack to manipulate the multiple scan of used lib for qRScan

  void startScan() {
    this.setState( () {
      this.scanning = true;
    });
  }

  @override
  Widget build( BuildContext context ) {
    return Container(
      child: Column(
        children: <Widget>[
          this._getScannerPreviewWidget()
        ],
      ),
    );
  }

  Widget _getScannerPreviewWidget() {
    return 
    this.scanning 
    ? 
      Container(
        width: 280,
        height: 280,
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
          qrCodeCallback: (code) {
            if (scaned == false )  {
              setState(() => scaned = true);
              String couponCode = this._extractCouponCodeFromQRCode(code);

              this.widget.couponService.getCouponInformationByCouponCode(couponCode)
              .then( (Coupon coupon) {
                this.widget.couponRepository.save(coupon);
                setState(() {
                  scaned = true;
                  scanning = false;
                });
              })
              .catchError ( (error) {
                setState(() {
                  scaned = true;
                  scanning = false;
                });
              });
            }
          },
        ),
      )
    :
      Container(
        width: 280,
        height: 280,
        child: Icon(Icons.crop_free, size: 300, color: Colors.blue[300]),
      );
  }

  String _extractCouponCodeFromQRCode(String code) {
    return code.split("|")[0];
  }

  

}