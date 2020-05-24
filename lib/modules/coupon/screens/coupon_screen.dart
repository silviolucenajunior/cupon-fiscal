import 'package:flutter/material.dart';
import '../widgets/coupon_header.dart';
import '../widgets/coupon_items_list.dart';


class CouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CouponHeaderWidget(),
        SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            // decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            // ),
            child: Expanded(
              child: SizedBox(
                height: 543,
                child: ListView(
                  children: [
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                    CouponItemWidget(color: Colors.blue[100]),
                    CouponItemWidget(color: Colors.blue[500]),
                  ]
                )
              ),
            )
          ),
        ),
        
      ]
    );
  }
}