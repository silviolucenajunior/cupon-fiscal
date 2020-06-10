import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GastoTotalMesGraphWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List series = List();
    return charts.BarChart(
      series,
      animate: false,
    );
  }

}