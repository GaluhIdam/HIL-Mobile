import 'dart:async';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hil_mobile/Models/taskModel.dart';
import 'package:hil_mobile/Pages/login_page.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Services/filterService.dart';
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
  final _priorityKey = GlobalKey<DropdownSearchState<String>>();
  final _acregKey = GlobalKey<DropdownSearchState<String>>();
  final _actypeKey = GlobalKey<DropdownSearchState<String>>();
  final _customerKey = GlobalKey<DropdownSearchState<String>>();
  final _statusKey = GlobalKey<DropdownSearchState<String>>();
  final _categoryKey = GlobalKey<DropdownSearchState<String>>();
  final _dateKey = GlobalKey<DropdownSearchState<String>>();
  final controller = ScrollController();
  final acregController = ScrollController();
  List<TaskListData> items = [];
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;
  String? token;
  String? name;
  int? id;
  String? unit;
  DateTime? currentBackPressTime;

  List<dynamic> actype = []; //penampungan data
  List<String> actypeFilter = []; //data yang buat filter nya
  List<String> actypeValue = []; //id data nya
  List<String> filterActype = []; //passing data labelnya

  List<String> acreg = [];
  List<String> filterAcreg = [];

  List<String> priorityFilter = [];
  List<String> filterPriority = [];
  List<String> priorityValue = [];
  List<dynamic> priority = [
    {
      'priorityID': "0",
      'priorityDesc': "HIGH",
    },
    {
      'priorityID': "1",
      'priorityDesc': "MEDIUM",
    },
    {
      'priorityID': "2",
      'priorityDesc': "LOW",
    },
    {
      'priorityID': "3",
      'priorityDesc': "NON",
    },
  ];

  List<dynamic> status = [
    {
      "statusID": "1",
      "statusDESC": "OVERDUEJOBS",
    },
    {
      "statusID": "2",
      "statusDESC": "DUE IN 3 DAY",
    },
    {
      "statusID": "3",
      "statusDESC": "DUE IN 1 WEEK",
    },
    {
      "statusID": "4",
      "statusDESC": "DUE IN 1 MONTH",
    },
    {
      "statusID": "5",
      "statusDESC": "DUE IN 3 MONTH",
    },
    {
      "statusID": "6",
      "statusDESC": "ISSUED LAST 3 DAYS",
    },
    {
      "statusID": "7",
      "statusDESC": "OPEN",
    },
    {
      "statusID": "8",
      "statusDESC": "CLOSE",
    },
    {
      "statusID": "9",
      "statusDESC": "EXTENSION 1",
    },
    {
      "statusID": "10",
      "statusDESC": "CLOSED BY SWIFT",
    },
    {
      "statusID": "11",
      "statusDESC": "NOCATEGORY",
    },
    {
      "statusID": "12",
      "statusDESC": "NAMCLOSE",
    },
  ];
  List<String> statusFilter = [];
  List<String> statusValue = [];
  List<String> filterStatus = [];

  List<dynamic> category = [];
  List<String> categoryFilter = [];
  List<String> filterCategory = [];
  List<String> categoryValue = [];

  List<String> issuedateFilter = [];
  List<String> filterIssuedate = [];
  List<String> issuedateValue = [];
  List<dynamic> issuedate = [
    {
      "sort": "priorityID",
      "date": "Priority",
    },
    {
      "sort": "acreg",
      "date": "A/C Registration",
    },
    {
      "sort": "Duedate",
      "date": "Issue Date",
    }
  ];

  List<String> customer = ["GA", "QG"];
  List<String> filterCustomer = [];
  bool connection = false;
  bool connectionTwo = false;
  List filterList = []; //data yg di passing

  @override
  void initState() {
    super.initState();
    greeting();
    AuthService.hasToken().then((value) {
      if (value['logging'] == true) {
        setState(() {
          token = value['token'];
        });
        for (var i = 0; i < priority.length; i++) {
          priorityFilter.add(priority[i]['priorityDesc']);
        }
        for (var i = 0; i < status.length; i++) {
          statusFilter.add(status[i]['statusDESC']);
        }
        for (var i = 0; i < issuedate.length; i++) {
          issuedateFilter.add(issuedate[i]['date']);
        }
        FilterService.getAcreg(token).then((item) {
          for (var i = 0; i < item.length; i++) {
            acreg.add(item[i]['acreg']);
          }
        });
        FilterService.getActype(token).then((item) {
          setState(() {
            actype = item;
          });
          for (var i = 0; i < item.length; i++) {
            actypeFilter.add(item[i]['ACType']);
          }
        });
        FilterService.getCategory(token).then((item) {
          setState(() {
            category = item;
          });
          for (var i = 0; i < item.length; i++) {
            categoryFilter.add(item[i]['CategoryDesc']);
          }
        });
        getUser(token).then((value) {
          if (value["logging"] == true) {
            setState(() {
              name = value["data"]['name'];
              id = value["data"]['id'];
              unit = value["data"]['unit'];
            });
            filterACREG(token, _search.text, filterList).then((value) {
              setState(() {
                connection = true;
              });
            });
            controller.addListener(() {
              if (controller.position.maxScrollExtent == controller.offset) {
                filterACREG(token, _search.text, filterList);
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
  }

  @override
  void dispose() {
    _search.dispose();
    controller.dispose();
    acregController.dispose();
    super.dispose();
  }

  Future passingPRIORITY() async {
    for (var i = 0; i < priority.length; i++) {
      for (var x = 0; x < filterPriority.length; x++) {
        if (priority[i]['priorityDesc'] == filterPriority[x]) {
          priorityValue.add(priority[i]['priorityID']);
        }
      }
    }
  }

  Future passingSTATUS() async {
    for (var i = 0; i < status.length; i++) {
      for (var x = 0; x < filterStatus.length; x++) {
        if (status[i]['statusDESC'] == filterStatus[x]) {
          statusValue.add(status[i]['statusID']);
        }
      }
    }
  }

  Future passingACTYPE() async {
    for (var i = 0; i < actype.length; i++) {
      for (var x = 0; x < filterActype.length; x++) {
        if (actype[i]['ACType'] == filterActype[x]) {
          actypeValue.add(actype[i]['ACTypeID']);
        }
      }
    }
  }

  Future passingCATEGORY() async {
    for (var i = 0; i < category.length; i++) {
      for (var x = 0; x < filterCategory.length; x++) {
        if (category[i]['CategoryDesc'] == filterCategory[x]) {
          categoryValue.add(category[i]['CategoryNo']);
        }
      }
    }
  }

  Future passingDATE() async {
    for (var i = 0; i < issuedate.length; i++) {
      for (var x = 0; x < filterIssuedate.length; x++) {
        if (issuedate[i]['date'] == filterIssuedate[x]) {
          issuedateValue.add(issuedate[i]['sort']);
        }
      }
    }
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

  Future filterACREG(String? token, String? search, List filterList) async {
    if (isLoading) return;
    isLoading = true;
    const limit = 10;
    String urlTask = getURL() + 'task-list?search=$search';
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse(urlTask));
    if (filterList.isNotEmpty) {
      request.body = json.encode(filterList[0]);
      print(request.body);
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = await response.stream.bytesToString();
      final parsed = jsonDecode(json)['data']['data'];
      final List cekdata = parsed;
      setState(() {
        connection = true;
        page++;
        isLoading = false;
        if (cekdata.length < limit) {
          hasMore = false;
        }
        items.addAll(parsed
            .map<TaskListData>((json) => TaskListData.fromJson(json))
            .toList());
      });
    } else {
      return response.reasonPhrase;
    }
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 0;
      items.clear();
    });
    filterACREG(token, _search.text, filterList);
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
                      margin: const EdgeInsets.fromLTRB(15, 20, 8, 0),
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
                      margin: const EdgeInsets.fromLTRB(15, 5, 8, 5),
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
                    margin: const EdgeInsets.fromLTRB(15, 5, 8, 5),
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
                            child: Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: TextField(
                            textInputAction: TextInputAction.go,
                            onSubmitted: ((value) {
                              if (value.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        'Finding data...',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                );
                                setState(() {
                                  connection = false;
                                  hasMore = true;
                                  items.clear();
                                });
                                filterACREG(token, value, filterList);
                                controller.addListener(() {
                                  if (controller.position.maxScrollExtent ==
                                      controller.offset) {
                                    filterACREG(token, value, filterList);
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
                          ),
                        )),
                        GestureDetector(
                          onTap: () {
                            if (connection == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      'Finding data...',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                              );
                              setState(() {
                                connection = false;
                                hasMore = true;
                                items.clear();
                              });
                              filterACREG(token, _search.text, filterList);
                              controller.addListener(() {
                                if (controller.position.maxScrollExtent ==
                                    controller.offset) {
                                  filterACREG(token, _search.text, filterList);
                                }
                              });
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Color.fromRGBO(1, 98, 153, 1),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (connection == true) {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ListView(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      25, 20, 0, 20),
                                                  child: Text('Filter By',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromRGBO(
                                                            1, 98, 153, 1),
                                                      )),
                                                )),
                                            Align(
                                                alignment: Alignment.center,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                      margin: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 15, 25, 20),
                                                      child: const Icon(
                                                          Icons.close)),
                                                )),
                                          ],
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Priority'),
                                            )),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 10, 25, 0),
                                          child: DropdownSearch<
                                              String>.multiSelection(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                            fillColor: const Color
                                                                    .fromRGBO(
                                                                226,
                                                                234,
                                                                239,
                                                                1),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                            items: priorityFilter,
                                            key: _priorityKey,
                                            onChanged: (value) {
                                              filterPriority.addAll(value);
                                            },
                                            popupProps:
                                                PopupPropsMultiSelection.dialog(
                                                    containerBuilder:
                                                        (ctx, popupWidget) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    // How should I select all items in the list?
                                                                    _priorityKey
                                                                        .currentState
                                                                        ?.popupSelectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Select All'),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    // How should I unselect all items in the list?
                                                                    _priorityKey
                                                                        .currentState
                                                                        ?.popupDeselectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Unselect All'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  popupWidget),
                                                        ],
                                                      );
                                                    },
                                                    showSearchBox: true,
                                                    showSelectedItems: true,
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Select Priority',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('A/C Registration'),
                                            )),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 10, 25, 0),
                                          child: DropdownSearch<
                                              String>.multiSelection(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                            fillColor: const Color
                                                                    .fromRGBO(
                                                                226,
                                                                234,
                                                                239,
                                                                1),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                            items: acreg,
                                            key: _acregKey,
                                            popupProps:
                                                PopupPropsMultiSelection.dialog(
                                                    containerBuilder:
                                                        (ctx, popupWidget) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    // How should I select all items in the list?
                                                                    _acregKey
                                                                        .currentState
                                                                        ?.popupSelectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Select All'),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    _acregKey
                                                                        .currentState
                                                                        ?.popupDeselectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Unselect All'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  popupWidget),
                                                        ],
                                                      );
                                                    },
                                                    showSearchBox: true,
                                                    showSelectedItems: true,
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Select A/C Registration',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
                                            onChanged: (value) {
                                              filterAcreg.addAll(value);
                                            },
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('A/C Type'),
                                            )),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 10, 25, 0),
                                          child: DropdownSearch<
                                              String>.multiSelection(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                            fillColor: const Color
                                                                    .fromRGBO(
                                                                226,
                                                                234,
                                                                239,
                                                                1),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                            items: actypeFilter,
                                            key: _actypeKey,
                                            popupProps:
                                                PopupPropsMultiSelection.dialog(
                                                    containerBuilder:
                                                        (ctx, popupWidget) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    _actypeKey
                                                                        .currentState
                                                                        ?.popupSelectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Select All'),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    _actypeKey
                                                                        .currentState
                                                                        ?.popupDeselectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Unselect All'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  popupWidget),
                                                        ],
                                                      );
                                                    },
                                                    showSearchBox: true,
                                                    showSelectedItems: true,
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Select A/C Type',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
                                            onChanged: (value) {
                                              filterActype.addAll(value);
                                            },
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Customer'),
                                            )),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 10, 25, 0),
                                          child: DropdownSearch<
                                              String>.multiSelection(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                            fillColor: const Color
                                                                    .fromRGBO(
                                                                226,
                                                                234,
                                                                239,
                                                                1),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                            items: customer,
                                            key: _customerKey,
                                            popupProps:
                                                PopupPropsMultiSelection.dialog(
                                                    containerBuilder:
                                                        (ctx, popupWidget) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    _customerKey
                                                                        .currentState
                                                                        ?.popupSelectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Select All'),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    _customerKey
                                                                        .currentState
                                                                        ?.popupDeselectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Unselect All'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  popupWidget),
                                                        ],
                                                      );
                                                    },
                                                    showSearchBox: true,
                                                    showSelectedItems: true,
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Select Customer',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
                                            onChanged: (value) {
                                              filterCustomer.addAll(value);
                                            },
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Status'),
                                            )),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 10, 25, 0),
                                          child: DropdownSearch<
                                              String>.multiSelection(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                            fillColor: const Color
                                                                    .fromRGBO(
                                                                226,
                                                                234,
                                                                239,
                                                                1),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                            items: statusFilter,
                                            key: _statusKey,
                                            onChanged: (value) {
                                              filterStatus.addAll(value);
                                            },
                                            popupProps:
                                                PopupPropsMultiSelection.dialog(
                                                    showSearchBox: true,
                                                    showSelectedItems: true,
                                                    containerBuilder:
                                                        (ctx, popupWidget) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    // How should I select all items in the list?
                                                                    _statusKey
                                                                        .currentState
                                                                        ?.popupSelectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Select All'),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    // How should I unselect all items in the list?
                                                                    _statusKey
                                                                        .currentState
                                                                        ?.popupDeselectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Unselect All'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  popupWidget),
                                                        ],
                                                      );
                                                    },
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Select Status',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Category'),
                                            )),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 10, 25, 0),
                                          child: DropdownSearch<
                                              String>.multiSelection(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                            fillColor: const Color
                                                                    .fromRGBO(
                                                                226,
                                                                234,
                                                                239,
                                                                1),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                            items: categoryFilter,
                                            key: _categoryKey,
                                            popupProps:
                                                PopupPropsMultiSelection.dialog(
                                                    showSearchBox: true,
                                                    containerBuilder:
                                                        (ctx, popupWidget) {
                                                      return Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    _categoryKey
                                                                        .currentState
                                                                        ?.popupSelectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Select All'),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    OutlinedButton(
                                                                  onPressed:
                                                                      () {
                                                                    _categoryKey
                                                                        .currentState
                                                                        ?.popupDeselectAllItems();
                                                                  },
                                                                  child: const Text(
                                                                      'Unselect All'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  popupWidget),
                                                        ],
                                                      );
                                                    },
                                                    showSelectedItems: true,
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Select Category',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
                                            onChanged: (value) {
                                              filterCategory.addAll(value);
                                            },
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              25, 30, 25, 0),
                                          child: Divider(
                                            thickness: 0.5,
                                            height: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 10),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text('Sort By',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromRGBO(
                                                        1, 98, 153, 1),
                                                  )),
                                            )),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 10, 25, 0),
                                          child: DropdownSearch<String>(
                                            dropdownDecoratorProps:
                                                DropDownDecoratorProps(
                                                    dropdownSearchDecoration:
                                                        InputDecoration(
                                                            fillColor: const Color
                                                                    .fromRGBO(
                                                                226,
                                                                234,
                                                                239,
                                                                1),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)))),
                                            items: issuedateFilter,
                                            key: _dateKey,
                                            popupProps:
                                                PopupPropsMultiSelection.dialog(
                                                    showSearchBox: false,
                                                    showSelectedItems: true,
                                                    title: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Select Sort',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )),
                                            onChanged: (value) {
                                              filterIssuedate.add(value!);
                                            },
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              25, 30, 25, 10),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        1, 98, 153, 1),
                                                minimumSize:
                                                    const Size.fromHeight(45),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () {
                                              setState(() {
                                                connection = false;
                                              });
                                              filterList.clear();
                                              passingPRIORITY();
                                              passingACTYPE();
                                              passingSTATUS();
                                              passingCATEGORY();
                                              passingDATE();
                                              if (priorityValue.isEmpty &&
                                                  filterAcreg.isEmpty &&
                                                  actypeValue.isEmpty &&
                                                  filterCustomer.isEmpty &&
                                                  statusValue.isEmpty &&
                                                  categoryValue.isEmpty &&
                                                  issuedateValue.isEmpty) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                        "Can't filtering data, please select one!",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor:
                                                          Colors.green,
                                                      content: Text(
                                                        "Filtering data...",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                );
                                                Navigator.pop(context);
                                                filterList.add({
                                                  'filter_priority':
                                                      priorityValue,
                                                  'filter_ac_reg': filterAcreg,
                                                  'filter_ac_type': actypeValue,
                                                  'filter_customer':
                                                      filterCustomer,
                                                  'filter_status': statusValue,
                                                  'filter_category':
                                                      categoryValue,
                                                  "order":
                                                      issuedateValue.isEmpty
                                                          ? "Duedate"
                                                          : issuedateValue[0],
                                                  "by": "desc"
                                                });
                                                refresh();
                                                priorityValue.clear();
                                                filterAcreg.clear();
                                                actypeValue.clear();
                                                filterCustomer.clear();
                                                statusValue.clear();
                                                categoryValue.clear();
                                                issuedateValue.clear();
                                                filterList.clear();
                                              }
                                            },
                                            child: const Text(
                                              'Save',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
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
                                          dueDate: item.dueStatus == "1"
                                              ? 'OVERDUEJOBS'
                                              : item.dueStatus == "2"
                                                  ? 'DUE IN 3 DAY'
                                                  : item.dueStatus == "3"
                                                      ? "DUE IN 1 WEEK"
                                                      : item.dueStatus == "4"
                                                          ? "DUE IN 1 MONTH"
                                                          : item.dueStatus ==
                                                                  "5"
                                                              ? 'DUE IN 3 MONTH'
                                                              : item.dueStatus ==
                                                                      "6"
                                                                  ? "ISSUED LAST 3 DAYS"
                                                                  : item.dueStatus ==
                                                                          "7"
                                                                      ? "OPEN"
                                                                      : item.dueStatus ==
                                                                              "8"
                                                                          ? "CLOSE"
                                                                          : item.dueStatus ==
                                                                                  "9"
                                                                              ? "EXTENSION 1"
                                                                              : item.dueStatus ==
                                                                                      "10"
                                                                                  ? "CLOSED BY SWIFT"
                                                                                  : item.dueStatus ==
                                                                                          "11"
                                                                                      ? "NOCATEGORY"
                                                                                      : item.dueStatus ==
                                                                                              "11"
                                                                                          ? "NAMCLOSE"
                                                                                          : '-',
                                          cardBackgroundColor: item.priority,
                                          lastFollow: item.lastFollow != null
                                              ? item.lastFollow['Follow']
                                              : '-',
                                          labelColor: item.priority,
                                          labelText: item.priority,
                                          title: item.acreg,
                                          code: item.itemId,
                                          info: item.subject,
                                          itemId: item.itemId,
                                          dateOccur: item.dateoccur,
                                          statusDue: item.dueStatus == "1"
                                              ? 'OVERDUEJOBS'
                                              : item.dueStatus == "2"
                                                  ? 'DUE IN 3 DAY'
                                                  : item.dueStatus == "3"
                                                      ? "DUE IN 1 WEEK"
                                                      : item.dueStatus == "4"
                                                          ? "DUE IN 1 MONTH"
                                                          : item.dueStatus ==
                                                                  "5"
                                                              ? 'DUE IN 3 MONTH'
                                                              : item.dueStatus ==
                                                                      "6"
                                                                  ? "ISSUED LAST 3 DAYS"
                                                                  : item.dueStatus ==
                                                                          "7"
                                                                      ? "OPEN"
                                                                      : item.dueStatus ==
                                                                              "8"
                                                                          ? "CLOSE"
                                                                          : item.dueStatus == "9"
                                                                              ? "EXTENSION 1"
                                                                              : item.dueStatus == "10"
                                                                                  ? "CLOSED BY SWIFT"
                                                                                  : item.dueStatus == "11"
                                                                                      ? "NOCATEGORY"
                                                                                      : item.dueStatus == "11"
                                                                                          ? "NAMCLOSE"
                                                                                          : '-',
                                          dateInsert: DateFormat('d MMM y').format(item.duedate),
                                          description: item.description,
                                          categoryDesc: item.categoryText,
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
