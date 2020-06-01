import 'package:flutter/material.dart';
import './screens/coupon_screen.dart';
import './screens/home_screen.dart';
import './screens/coupon_list_screen.dart';
import './coupon_repository.dart';


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