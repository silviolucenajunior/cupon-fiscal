
import 'package:flutter/material.dart';
import '../widgets/coupon_qr_scanner.dart';
import '../coupon_repository.dart';
import '../coupon_services.dart';

class HomeScreenCoupon extends StatelessWidget {
  ICouponRepository couponRepository;

  HomeScreenCoupon({Key key, this.couponRepository}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Center(
        child: CouponQRScanner(
          couponService: NFCECearaCouponService(),
          couponRepository: this.couponRepository,
        ),
    );
  }
}