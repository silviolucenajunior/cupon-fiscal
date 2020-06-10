import 'package:flutter/material.dart';
import '../coupon_repository.dart';
import './home_screen.dart';
import './coupon_list_screen.dart';

class MeuCuponMainPage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    InMemoryCouponRepository repository = InMemoryCouponRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu cupon')
      ),
      body: TabBarView(
        children: <Widget>[
          HomeScreenCoupon(couponRepository: repository),
          CouponListScreen(couponRepository: repository)
        ],
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blue[600],
        unselectedLabelColor: Colors.blue[200],
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(0),
        indicatorColor: Colors.blue,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
            text: 'Scanner'
          ),
          Tab(
            icon: Icon(Icons.settings),
            text: 'Coupons'
          ),
        ],
      )
    );
  }
}