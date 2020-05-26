import 'dart:convert';

import 'package:http/http.dart' as http;
import './coupon_factory.dart';
import './models/coupon_model.dart';
import './coupon_repository.dart';

class ICouponService {
  Object getCouponInformationByCouponCode(String couponCode) async {
    return Object;
  }

  void save(Coupon coupon) {
  }
}

class NFCECearaCouponService extends ICouponService {
  final String NFCECEARA_ENDPOINT = "https://cfe.sefaz.ce.gov.br:8443/portalcfews/mfe/fiscal-coupons/extract/";

  @override
  Future<Coupon> getCouponInformationByCouponCode(String couponCode ) async {
    String endpoint = this.NFCECEARA_ENDPOINT + couponCode;
    final http.Response response = await http.get(endpoint);
    final responseJson = json.decode(response.body);

    Future<Coupon>coupon = Future<Coupon>( () {
      return CouponFactory.fromJson(responseJson["coupon"]);
    });

    //Coupon coupon = CouponFactory.fromJson(responseJson["coupon"]);

    return coupon;
  }
}