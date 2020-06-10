import 'package:flutter/material.dart';
import './screens/coupon_screen.dart';
import './screens/main_screen.dart';

class CouponRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch( settings.name ) {
      case '/coupon': 
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Cupon Fiscal"),
              ),
              body: CouponScreen(coupon: args),
            );
          }
        );
      case '/':
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return DefaultTabController(
              length: 2,
              child: MeuCuponMainPage()
            );
        });
    }
  }
}