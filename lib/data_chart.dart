import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hil_mobile/data_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataChart extends StatelessWidget {
  final List<DataSeries> data;

  const DataChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataSeries, String>> series = [
      charts.Series(
        id: 'Data',
        data: data,
        domainFn: (DataSeries series, _) => series.title,
        measureFn: (DataSeries series, _) => series.data,
        colorFn : (DataSeries series, _) => series.barColor,
      ),
    ];

    return charts.BarChart(
      series,
      animate: true,
    );
  }
}