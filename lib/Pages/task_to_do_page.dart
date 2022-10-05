import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hil_mobile/Models/acregModel.dart';
import 'package:hil_mobile/Models/taskModel.dart';
import 'package:hil_mobile/Pages/login_page.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Widgets/dropdown.dart';
import 'package:hil_mobile/filter_modal.dart';
import 'package:intl/intl.dart';
import '../Widgets/cardTask.dart';
import 'package:http/http.dart' as http;

enum SortBy { due, issue }

class TaskToDoPage extends StatefulWidget {
  static const routeName = "/task_to_do_pages";

  const TaskToDoPage({Key? key}) : super(key: key);

  @override
  State<TaskToDoPage> createState() => _TaskToDoPageState();
}

class _TaskToDoPageState extends State<TaskToDoPage> {
  final TextEditingController _search = TextEditingController();
  SortBy? _value = SortBy.due;
  final controller = ScrollController();
  final acregController = ScrollController();
  List<TaskListData> items = [];
  bool hasMore = true;
  List<DataAcreg> acregList = [];
  int page = 1;
  bool isLoading = false;
  String? token;
  String? name;
  int? id;
  String? unit;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    greeting();
    AuthService.hasToken().then((value) {
      if (value['logging'] == true) {
        setState(() {
          token = value['token'];
        });
        getUser(token).then((value) {
          if (value["logging"] == true) {
            setState(() {
              name = value["data"]['name'];
              id = value["data"]['id'];
              unit = value["data"]['unit'];
            });
            fetch(token, _search.text);
            acreg(token);
            controller.addListener(() {
              if (controller.position.maxScrollExtent == controller.offset) {
                fetch(token, _search.text);
              }
            });
          } else {
            return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
                (route) => false);
          }
        });
      } else {
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (route) => false);
      }
    });
    // test();
  }

  @override
  void dispose() {
    _search.dispose();
    controller.dispose();
    acregController.dispose();
    super.dispose();
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Afternoon';
    } else if (hour >= 18 && hour < 22) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }

  getURL() {
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

  // Future test() async {
  //   var headers = {
  //     'Authorization': 'Bearer 177|EmH8IR34c8CMHUQZmFojcYn0zEub2NfCQBpZ9Nc7'
  //   };
  //   var request = http.MultipartRequest(
  //       'GET',
  //       Uri.parse(
  //           'http://172.16.122.133:8000/api/task-list?order=DateOccur&by=asc'));
  //   request.fields.addAll({'filter_ac_reg': 'PK-GPW'});

  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     var data = await response.stream.bytesToString();
  //     var json = jsonDecode(data);
  //     final parsed = json['data']['data'];
  //     print(parsed);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  Future fetch(String? token, String? search) async {
    if (isLoading) return;
    isLoading = true;
    const limit = 10;
    if (token != null) {
      if (search != null) {
        String urlTask = getURL() + 'task-list?search=$search';
        final response = await http.get(Uri.parse(urlTask),
            headers: {'Authorization': 'Bearer $token'});
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          final parsed = json['data']['data'];
          final List cekdata = parsed;
          setState(() {
            page++;
            isLoading = false;
            if (cekdata.length < limit) {
              hasMore = false;
            }
            items.addAll(parsed
                .map<TaskListData>((json) => TaskListData.fromJson(json))
                .toList());
          });
        }
      } else {
        String urlTask = getURL() + 'task-list';
        final response = await http.get(Uri.parse(urlTask),
            headers: {'Authorization': 'Bearer $token'});
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          final parsed = json['data']['data'];
          final List cekdata = parsed;
          setState(() {
            page++;
            isLoading = false;
            if (cekdata.length < limit) {
              hasMore = true;
            }
            items.addAll(parsed
                .map<TaskListData>((json) => TaskListData.fromJson(json))
                .toList());
          });
        }
      }
    } else {
      return Navigator.pushNamed(context, LoginPage.routeName);
    }
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 0;
      items.clear();
    });
    fetch(token, _search.text);
  }

  Future acreg(String? token) async {
    String urlAcreg = getURL() + 'master-acreg';
    final response = await http
        .get(Uri.parse(urlAcreg), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data']['data'];
      setState(() {
        page++;
        acregList.addAll(
            parsed.map<DataAcreg>((json) => DataAcreg.fromJson(json)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
            onWillPop: onWillPop,
            child: SafeArea(
                child: Container(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Good ${greeting()},',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(1, 98, 153, 1),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                              top: 0,
                              right: 8,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(25, 20, 25, 5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    titleTextStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 197, 0, 0)),
                                    title: Text(
                                      'Log Out',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    content: Text(
                                      'Are you sure you want to leave?',
                                    ),
                                    actions: <Widget>[
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  AuthService.logout(token)
                                                      .then((value) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          backgroundColor:
                                                              Colors.green,
                                                          content: Text(
                                                            value,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )),
                                                    );
                                                    AuthService.deleteToken();
                                                    Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                LoginPage()),
                                                        (route) => false);
                                                  });
                                                },
                                                child: Text(
                                                  'Log Out',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 197, 0, 0)),
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                child: Icon(
                                  Icons.logout,
                                  color: Color.fromARGB(255, 197, 0, 0),
                                ),
                              )),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
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
                    margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                    child: Row(
                      children: <Widget>[
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
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Row(
                      children: [
                        Flexible(
                            child: TextField(
                          textInputAction: TextInputAction.go,
                          onSubmitted: ((value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                hasMore = true;
                                items.clear();
                              });
                              fetch(
                                token,
                                value,
                              );
                              controller.addListener(() {
                                if (controller.position.maxScrollExtent ==
                                    controller.offset) {
                                  fetch(token, value);
                                }
                              });
                            }
                          }),
                          controller: _search,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor:
                                  const Color.fromRGBO(1, 98, 153, 1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(1, 98, 153, 1)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.all(14),
                              hintText: 'insert keyword'),
                        )),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return DropDownSearch();
                                });
                          },
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.filter_alt_outlined,
                                  size: 30,
                                  color: Color.fromRGBO(1, 98, 153, 1),
                                ),
                              )),
                        ),
                        sortData(context),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                          child: RefreshIndicator(
                              onRefresh: refresh,
                              child: ListView.builder(
                                  controller: controller,
                                  itemCount: items.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index < items.length) {
                                      final item = items[index];
                                      return TaskCard(
                                          id: item.itemId,
                                          cardBackgroundColor: item.statusDesc,
                                          labelColor: item.statusDesc,
                                          labelText: item.statusDesc,
                                          title: item.acreg,
                                          code: item.itemId,
                                          info: item.subject,
                                          itemId: item.itemId,
                                          dateOccur: item.dateOccur,
                                          dueDate: DateFormat('d MMM y').format(
                                              DateTime.parse(item.dueDate)),
                                          dateInsert: DateFormat('d MMM y')
                                              .format(DateTime.parse(
                                                  item.dateInsert)),
                                          dateClose: item.dateClose,
                                          ddgRef: item.ddgRef,
                                          flightNo: item.flightNo,
                                          ataNo: item.ataNo,
                                          seqNo: item.seqNo,
                                          sta: item.sta,
                                          staClose: item.staClose,
                                          subject: item.subject,
                                          description: item.description,
                                          category: item.categoryCat,
                                          subAta: item.subAta,
                                          insertProblem: item.insertProblem,
                                          techlog: item.techlog,
                                          status: item.status,
                                          acreg: item.acreg,
                                          acType: item.acType,
                                          statusNo: item.statusNo,
                                          statusDesc: item.statusDesc,
                                          staId: item.staId,
                                          staCode: item.staCode,
                                          optionId: item.optionId,
                                          longName: item.longName,
                                          partNbr: item.partNbr,
                                          partName: item.partName,
                                          reason: item.reason,
                                          categoryDesc: item.categoryCat,
                                          dueDateDetail: item.dueDate,
                                          token: token);
                                    } else {
                                      if (hasMore == true) {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 32),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 32),
                                          child: Center(
                                            child: Text('Data not available!'),
                                          ),
                                        );
                                      }
                                    }
                                  }))))
                ],
              ),
            ))));
    // );
  }

  GestureDetector filterData(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, setState) {
                return SizedBox(
                  height: 700,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: const Text('Filter',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(1, 98, 153, 1),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                                child: const Icon(Icons.close)),
                          )
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 20, 0, 10),
                          width: double.infinity,
                          child: const Text(
                            'Priority',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 40.0,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FilterModal(
                              filterLabel: 'High',
                              backgroundColor: Color.fromRGBO(181, 12, 12, 1),
                              selectedColor: Color.fromRGBO(181, 12, 12, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Medium',
                              backgroundColor: Color.fromRGBO(255, 200, 16, 1),
                              selectedColor: Color.fromRGBO(255, 200, 16, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Low',
                              backgroundColor: Color.fromRGBO(255, 200, 16, 1),
                              selectedColor: Color.fromRGBO(255, 200, 16, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Non',
                              backgroundColor: Color.fromRGBO(159, 159, 159, 1),
                              selectedColor: Color.fromRGBO(159, 159, 159, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                          width: double.infinity,
                          child: const Text(
                            'A/C Registration',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 30.0,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          controller: acregController,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FilterModal(
                              filterLabel: 'PK-GJJ',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-GWL',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-JJK',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-WWG',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                          width: double.infinity,
                          child: const Text(
                            'Subject',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 30.0,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FilterModal(
                              filterLabel: 'Light',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Equipment & Furnishing',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Cabin',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(66, 66, 66, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: () {},
                            child: const Text(
                              'Reset',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(1, 98, 153, 1),
                              minimumSize: const Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
            });
      },
      child: Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_alt_outlined,
              size: 30,
              color: Color.fromRGBO(1, 98, 153, 1),
            ),
          )),
    );
  }

  GestureDetector sortData(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, setState) {
                return SizedBox(
                  height: 320,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                            child: const Text('Sort',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(1, 98, 153, 1),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(0, 15, 15, 10),
                                child: const Icon(Icons.close)),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            RadioListTile<SortBy>(
                              title: const Text('By Due Date'),
                              value: SortBy.due,
                              groupValue: _value,
                              onChanged: (SortBy? value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            RadioListTile<SortBy>(
                              title: const Text('By Issue Date'),
                              value: SortBy.issue,
                              groupValue: _value,
                              onChanged: (SortBy? value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(1, 98, 153, 1),
                              minimumSize: const Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
            });
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.sort_by_alpha,
              size: 30,
              color: Color.fromRGBO(1, 98, 153, 1),
            ),
          )),
    );
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
