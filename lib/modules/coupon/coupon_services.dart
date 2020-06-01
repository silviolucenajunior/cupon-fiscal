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
    final normailizedJson = normalizeJsonCoupon(responseJson);

    Future<Coupon>coupon = Future<Coupon>( () {
      return CouponFactory.fromJson(normailizedJson["coupon"]);
    });

    return coupon;
  }

  Map<dynamic, dynamic> normalizeJsonCoupon(Map<dynamic, dynamic> couponAsJson) {
    if (couponAsJson['coupon']['taxpayerObservation'] != null) {
      couponAsJson['coupon']['taxpayerObservation'] = couponAsJson['coupon']['taxpayerObservation'].split(" ")[0] + " " + couponAsJson['coupon']['taxpayerObservation'].split(" ")[1];
    }
    couponAsJson['coupon']['items'].forEach( (item) {
      item['price'] = (item['price'] * 100).toInt();
    });

    return couponAsJson;
  }
}