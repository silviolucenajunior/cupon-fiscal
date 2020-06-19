import 'package:flutter/material.dart';
import '../widgets/coupon_thumbnail.dart';
import '../coupon_repository.dart';

class CouponListScreen extends StatelessWidget {
  final ICouponRepository couponRepository;

  CouponListScreen({Key key, this.couponRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: this._getCouponThumbnailList(context)
      )
    );
  }

  List<Widget> _getCouponThumbnailList(BuildContext context){
    List<Widget> items = [];
    this.couponRepository.getAll().asMap().forEach( (index, coupon) => {
      items.add(
        this._getCouponThumbnailItem(context, coupon, Colors.blue[index % 2 == 0 ? 100 : 300])
      )
    });

    return items;
  }

  Widget _getCouponThumbnailItem(BuildContext context, coupon, color) {
    return Material(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white30,
        onTap: () {
          Navigator.of(context).pushNamed('/coupon', arguments: coupon);
        },
        child: CouponThumbnailWidget(coupon: coupon, color: color) 
      )
    );
  }
}