import 'package:flutter/material.dart';
import './screens/coupon_screen.dart';
import './screens/home_screen.dart';


class CouponRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch( settings.name ) {
      case '/coupon': 
        return PageRouteBuilder(
          pageBuilder: (_,__,___) => Scaffold(
            appBar: AppBar(
              title: Text("Cupon Fiscal"),
            ),
            body: CouponScreen(coupon: args),
          ),
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      case '/':
        return PageRouteBuilder(
          pageBuilder: (_,__,___) => Scaffold(
            appBar: AppBar(
              title: Text("Meu Cupons"),
            ),
            body: HomeScreenCoupon(),
          ),
          transitionsBuilder: (_, anim, __, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
    }
  }
}