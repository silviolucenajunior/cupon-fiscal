
import 'package:flutter/material.dart';
import '../widgets/coupon_qr_scanner.dart';
import '../coupon_services.dart';

class HomeScreenCoupon extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Center(
        child: CouponQRScanner(
          couponService: NFCECearaCouponService()
        ),
    );
  }
}