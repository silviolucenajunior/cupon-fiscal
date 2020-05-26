import 'package:flutter/material.dart';
import './modules/coupon/screens/home_screen.dart';
import './modules/coupon/screens/coupon_screen.dart';
import './modules/coupon/screens/coupon_list_screen.dart';
import './modules/coupon/coupon_routes.dart';
import './modules/coupon/coupon_repository.dart';


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

class MeuCuponMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InMemoryCouponRepository repository = InMemoryCouponRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Cupon"),
      ),
      body: TabBarView(
        children: <Widget>[
          HomeScreenCoupon(couponRepository: repository),
          CouponListScreen(couponRepository: repository),
        ]
      ),
      bottomNavigationBar: TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
            text: 'Scanner',
          ),
          Tab(
            icon: Icon(Icons.settings),
            text: 'Coupons',
          )
        ],
        labelColor: Colors.blue[600],
        unselectedLabelColor: Colors.blue[200],
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(0.0),
        indicatorColor: Colors.blue,
      )
    );
  }
}