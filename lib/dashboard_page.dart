import 'package:flutter/material.dart';
import 'data_chart.dart' show DataChart;
import 'package:hil_mobile/data_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<DataSeries> data1 = [
    DataSeries(
        title: 'A330',
        data: 30,
        barColor: charts.ColorUtil.fromDartColor(
          Colors.blue,
        )),
    DataSeries(
        title: 'B777',
        data: 44,
        barColor: charts.ColorUtil.fromDartColor(Colors.red)),
    DataSeries(
        title: 'B737-800',
        data: 23,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow)),
    DataSeries(
        title: 'A320',
        data: 40,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    DataSeries(
        title: 'A320',
        data: 30,
        barColor: charts.ColorUtil.fromDartColor(Colors.purple)),
  ];

  final List<DataSeries> data2 = [
    DataSeries(
        title: 'PK-GMA',
        data: 3,
        barColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GNA',
        data: 4,
        barColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GNR',
        data: 2,
        barColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GNT',
        data: 3,
        barColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GMC',
        data: 6,
        barColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(1, 98, 153, 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                width: double.infinity,
                child: Text(
                  'Sigit Prayoga',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(1, 98, 153, 1),
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Row(
                children: [
                  Text(
                    '6618819',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(1, 98, 153, 1),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(209, 214, 217, 1),
                    radius: 3,
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Text(
                    'TLC-7',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(239, 173, 66, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              height: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HIL Open by Follow On",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Expanded(child: DataChart(data: data1))
                  ]),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
              height: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HIL without Follow On",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Expanded(child: DataChart(data: data2))
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
