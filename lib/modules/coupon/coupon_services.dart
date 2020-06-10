import 'dart:convert';

import 'package:http/http.dart' as http;
import './coupon_factory.dart';
import './models/coupon_model.dart';

class ICouponService {
  Future<Coupon> getCouponInformationByCouponCode(String couponCode) async {
    return Future<Coupon>(() {
      return Coupon();
    });
  }

  void save(Coupon coupon) {
  }
}

class NFCECearaCouponService extends ICouponService {
  static const String NFCECEARA_ENDPOINT = "https://cfe.sefaz.ce.gov.br:8443/portalcfews/mfe/fiscal-coupons/extract/";

  @override
  Future<Coupon> getCouponInformationByCouponCode(String couponCode ) async {
    String endpoint = NFCECEARA_ENDPOINT + couponCode;
    final http.Response response = await http.get(endpoint);
    final responseJson = json.decode(response.body);
    if (isNotAValidResponse(responseJson)) {
      throw "Is not a valid response";
    }
    final normailizedJson = normalizeJsonCoupon(responseJson);

    Future<Coupon>coupon = Future<Coupon>( () {
      return CouponFactory.fromJson(normailizedJson["coupon"]);
    });

    return coupon;
  }

  bool isNotAValidResponse(Map<dynamic, dynamic> couponAsJson) {
    if (couponAsJson['status'] == 1) {
      return true;
    }

    return false;
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