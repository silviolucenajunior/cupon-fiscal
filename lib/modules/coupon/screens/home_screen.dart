import 'package:flutter/material.dart';
import '../widgets/coupon_qr_scanner.dart';
import '../widgets/coupon_scan_actions.dart';
import '../coupon_repository.dart';
import '../coupon_services.dart';

class CouponInputCommandManager {
  final qrScan;
  CouponInputCommandManager({this.qrScan});

  execute(command) {
    switch(command) {
      case 'scan':
        this.qrScan.startScan();
        break;
        //Do Camera Scan
      case 'digit':
        print("digit");
        break;
      case 'fake':
        print('Make Fake');
        break;
       //DO Dialog Input
    }
  }
}

class HomeScreenCoupon extends StatelessWidget {
  final ICouponRepository couponRepository;

  HomeScreenCoupon({Key key, this.couponRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        this._getImportCouponWidget(), 
        this._getGraphsWidget()
      ],
    );
  }

  Widget _getImportCouponWidget() {
    CouponQRScanner qrScanner = CouponQRScanner(
      couponService: NFCECearaCouponService(),
      couponRepository: this.couponRepository,
    );
    CouponInputCommandManager commandManager = new CouponInputCommandManager(qrScan: qrScanner);

    return Column(
      children: <Widget>[
        qrScanner,
        CouponScanActions(commandManager: commandManager,)
      ]
    );
  }

  Widget _getGraphsWidget() {
    return Expanded(
      child: Container(
        child: PageView(
          children: <Widget>[
            Center(
              child: Card(
                child:Container(
                  width: 300,
                  height: 300,
                )
              )
            ),
            Center(
              child:Container(
                height: 300,
                width: 100,
              )
            ),
            Center(
              child:Container(
                height: 300,
                width: 100,
              )
            )
          ]
        )
      )
    );
  }
}
