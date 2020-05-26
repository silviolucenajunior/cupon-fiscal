import 'package:flutter/material.dart';
import '../models/coupon_model.dart';
import '../widgets/coupon_header.dart';
import '../widgets/coupon_items_list.dart';

class CouponScreen extends StatelessWidget {
  final Coupon coupon;

  CouponScreen({Key key, this.coupon}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CouponHeaderWidget(coupon: coupon),
        SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Expanded(
              child: SizedBox(
                height: 543,
                child: ListView(
                  children: _getItemsWidget()
                )
              ),
            )
          ),
        ),
        
      ]
    );
  }

  List<Widget> _getItemsWidget() {
    List<Widget> items = List<Widget>();
    coupon.items.forEach( (item) {
      items.add(CouponItemWidget(item: item));
    });
    
    return items;
  }
}