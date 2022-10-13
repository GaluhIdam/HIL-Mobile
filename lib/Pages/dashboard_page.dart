import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hil_mobile/Pages/login_page.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:hil_mobile/data_chart.dart';
import 'package:hil_mobile/data_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  static const routeName = "/dashboard_page";
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DateTime? currentBackPressTime;
  final List<DataSeries> data1 = [
    DataSeries(
        title: 'A330',
        data: 30,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
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
        barColor: charts.ColorUtil.fromDartColor(
            const Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GNA',
        data: 4,
        barColor: charts.ColorUtil.fromDartColor(
            const Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GNR',
        data: 2,
        barColor: charts.ColorUtil.fromDartColor(
            const Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GNT',
        data: 3,
        barColor: charts.ColorUtil.fromDartColor(
            const Color.fromRGBO(1, 98, 153, 1))),
    DataSeries(
        title: 'PK-GMC',
        data: 6,
        barColor: charts.ColorUtil.fromDartColor(
            const Color.fromRGBO(1, 98, 153, 1))),
  ];

  String? token;
  String? name;
  int? id;
  String? unit;

  @override
  void initState() {
    super.initState();
    AuthService.hasToken().then((value) {
      if (value['logging'] == true) {
        setState(() {
          token = value['token'];
        });
      }
      getUser(token).then((value) {
        if (value["logging"] == true) {
          setState(() {
            name = value["data"]['name'];
            id = value["data"]['id'];
            unit = value["data"]['unit'];
          });
        } else {
          return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (route) => false);
        }
      });
    });
  }

  static getURL() {
    return Config.baseURL;
  }

  Future getUser(String? token) async {
    if (token != null) {
      String urlUser = getURL() + 'auth/user';
      final response = await http
          .get(Uri.parse(urlUser), headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data']['user'];
        return {"logging": true, "data": parsed};
      } else {
        return {"logging": false};
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
      child: WillPopScope(
          onWillPop: onWillPop,
          child: SafeArea(
              child: Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: ListView(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    width: double.infinity,
                    child: Text(
                      name == null ? '-' : name.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(1, 98, 153, 1),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(
                    children: [
                      Text(
                        id == null ? '-' : id.toString(),
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
                        unit == null ? '-' : unit.toString(),
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
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "HIL Open by Follow On",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: DataChart(data: data1))
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  height: 400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "HIL without Follow On",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Expanded(child: DataChart(data: data2))
                      ]),
                )
              ],
            ),
          ))),
    ));
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Back again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
