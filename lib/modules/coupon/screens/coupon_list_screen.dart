import 'package:flutter/material.dart';
import '../widgets/coupon_thumbnail.dart';
import '../coupon_repository.dart';
import '../models/coupon_model.dart';

class CouponListScreen extends StatelessWidget {
  final ICouponRepository couponRepository;

  CouponListScreen({Key key, this.couponRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.couponRepository.getAll(),
      builder: (context, AsyncSnapshot snapshot) {
        print("PORRA");
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<Widget> items = [];
            int index = 0;
            snapshot.data.forEach( (coupon) {
              print("*");
              print(coupon.stablishmentName);
              items.add(this._getCouponThumbnailItem(context, coupon, Colors.blue[index % 2 == 0 ? 100 : 300]));
              index += 1;
            });
            // snapshot.data.forEach( (index, coupon) {
            //   print(index);
            //   print(coupon);
            //   print('----');
            //   items.add(this._getCouponThumbnailItem(context, coupon, Colors.blue[index % 2 == 0 ? 100 : 300]));
            // });

            return Container(
              child: ListView(
                children: items
              )
            );
          }
          if (snapshot.hasError) {
            print("Merda"); 
          }
        } 
          return Text("Ovo");
      }
    );
    // return Container(
    //   child: ListView(
    //     children: this._getCouponThumbnailList(context)
    //   )
    // );
  }

  Future<List<Widget>> _getCouponThumbnailList(BuildContext context) async {
    List<Widget> items = [Text("opa")];
    List<Coupon> coupons =   await this.couponRepository.getAll();
    // this.couponRepository.getAll().asMap().forEach( (index, coupon) => {
    //   items.add(
    //     this._getCouponThumbnailItem(context, coupon, Colors.blue[index % 2 == 0 ? 100 : 300])
    //   )
    // });

    return Future<List<Widget>>( () => items);
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