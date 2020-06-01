import 'package:flutter/material.dart';

import './modules/coupon/coupon_routes.dart';


void main() {
  runApp(
    MeuCuponApp()
  );
}

class MeuCuponApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Cupon',
      theme: _getTheme(),
      onGenerateRoute: CouponRouteGenerator.generateRoute,
      initialRoute: '/',
      home: DefaultTabController(
        length: 2,
        child: MeuCuponMainPage()
      ),
    );
  }

  ThemeData _getTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity
    );
  }
}

