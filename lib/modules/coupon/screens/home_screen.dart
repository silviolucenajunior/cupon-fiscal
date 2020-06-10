import 'package:flutter/material.dart';
import '../widgets/coupon_qr_scanner.dart';
import '../coupon_repository.dart';
import '../coupon_services.dart';

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
    return CouponQRScanner(
      couponService: NFCECearaCouponService(),
      couponRepository: this.couponRepository,
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
