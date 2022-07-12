import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class DataSeries {
  final String title;
  final int data;
  final charts.Color barColor;

  DataSeries(
      {required this.title,
      required this.data,
      required this.barColor});
}
