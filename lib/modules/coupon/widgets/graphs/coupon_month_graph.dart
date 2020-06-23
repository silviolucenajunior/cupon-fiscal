import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts_flutter;
import 'package:meu_cupon_fiscal/modules/coupon/coupon_factory.dart';
import '../../models/coupon_timeserie.dart';


class CouponMonthGraphWidget extends StatefulWidget {
  dynamic monthGraphData;

  @override
  _CouponMonthGraphState createState() {
    return _CouponMonthGraphState();
  }
}

class _CouponMonthGraphState extends State<CouponMonthGraphWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: this.getGraphFake(context)
      )
    );
  }

  Widget getGraph(BuildContext context, List<TimeSeriesCoupon> series) {
    List<charts_flutter.Series<TimeSeriesCoupon, String>> serieslist = this._getSeries(series);

    return charts_flutter.BarChart(
      serieslist,
      animate: true
    );
  }

  List<charts_flutter.Series<TimeSeriesCoupon, String>> _getSeries(List<TimeSeriesCoupon> series) {
    return [ new charts_flutter.Series(
      id: 'CouponMonthGraph',
      data: series,
      domainFn: (dynamic coupon, int index) => coupon.day.day.toString(),
      measureFn: (dynamic coupon, int index) => coupon.value,
    )];
  }

  Widget getGraphFake(BuildContext context) {
    final series = [
      CouponFactory.generateFakeTimeSeriesCouponList(1),
      CouponFactory.generateFakeTimeSeriesCouponList(2),
      CouponFactory.generateFakeTimeSeriesCouponList(3),
      CouponFactory.generateFakeTimeSeriesCouponList(4),
      CouponFactory.generateFakeTimeSeriesCouponList(5),
      CouponFactory.generateFakeTimeSeriesCouponList(6),
      CouponFactory.generateFakeTimeSeriesCouponList(7),
      CouponFactory.generateFakeTimeSeriesCouponList(8),
      CouponFactory.generateFakeTimeSeriesCouponList(9),
      CouponFactory.generateFakeTimeSeriesCouponList(10),
      CouponFactory.generateFakeTimeSeriesCouponList(11),
      CouponFactory.generateFakeTimeSeriesCouponList(12),
      CouponFactory.generateFakeTimeSeriesCouponList(13),
      CouponFactory.generateFakeTimeSeriesCouponList(14),
      CouponFactory.generateFakeTimeSeriesCouponList(15),
      CouponFactory.generateFakeTimeSeriesCouponList(16),
    ];

    return this.getGraph(context, series);
  }
}