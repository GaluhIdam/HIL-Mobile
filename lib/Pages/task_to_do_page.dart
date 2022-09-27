import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/taskModel.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:hil_mobile/filter_modal.dart';
import 'package:intl/intl.dart';
import '../Widgets/cardTask.dart';
import 'package:http/http.dart' as http;

enum SortBy { due, issue }

// ignore: must_be_immutable
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
  List<TaskListData> items = [];
  int page = 1;
  final token = '1027|Wv9URBymV4NaMQM5LZw7PVJMP8SBM6TUjDK2R2W8';

  @override
  void initState() {
    super.initState();
    fetch(token, _search.text);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch(token, _search.text);
      }
    });
  }

  @override
  void dispose() {
    _search.dispose();
    controller.dispose();
    super.dispose();
  }

  getURL() {
    return Config.baseURL;
  }

  Future fetch(String token, String? search) async {
    if (search != null) {
      String urlTask = getURL() + 'task-list?search=$search';
      final response = await http
          .get(Uri.parse(urlTask), headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'];
        setState(() {
          page++;
          items.addAll(parsed
              .map<TaskListData>((json) => TaskListData.fromJson(json))
              .toList());
        });
      }
    } else {
      String urlTask = getURL() + 'task-list';
      final response = await http
          .get(Uri.parse(urlTask), headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'];
        setState(() {
          page++;
          items.addAll(parsed
              .map<TaskListData>((json) => TaskListData.fromJson(json))
              .toList());
        });
      }
    }
  }
  // else if(filterAcReg != null) {
  //       Uri urlTask = Uri.parse(getURL() + 'task-list?search=$search');
  //       dynamic params =
  //         filterAcReg.map((e) {
  //           return e['filter_ac_reg'];
  //         })
  //       ;
  //       final response = await http.get(urlTask.replace(queryParameters: params), headers: {'Authorization': 'Bearer $token', HttpHeaders.contentTypeHeader: "application/json",});
  //       if (response.statusCode == 200) {
  //         var json = jsonDecode(response.body);
  //         final parsed = json['data']['data'];
  //         setState(() {
  //           page++;
  //           items.addAll(parsed
  //               .map<TaskListData>((json) => TaskListData.fromJson(json))
  //               .toList());
  //         });
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    final passData = ModalRoute.of(context)?.settings.arguments as Map;
    String name = passData['data']['name'];
    int id = passData['data']['id'];
    String unit = passData['data']['unit'];
    String token = passData['token'];
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                child: const Text(
                  'Good Morning,',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(1, 98, 153, 1),
                  ),
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                width: double.infinity,
                child: Text(
                  name.toString(),
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
                    id.toString(),
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
                    unit,
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
                        prefixIconColor: const Color.fromRGBO(1, 98, 153, 1),
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
                  filterData(context),
                  sortData(context),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
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
                          dueDate: DateFormat('d MMM y')
                              .format(DateTime.parse(item.dueDate)),
                          dateInsert: DateFormat('d MMM y')
                              .format(DateTime.parse(item.dateInsert)),
                          dateClose: item.dateClose,
                          ddgRef: item.ddgRef,
                          flightNo: item.flightNo,
                          ataNo: item.ataNo,
                          seqNo: item.seqNo,
                          sta: item.sta,
                          staClose: item.staClose,
                          subject: item.subject,
                          description: item.description,
                          category: item.category,
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
                          categoryDesc: item.categoryDesc,
                          dueDateDetail: item.dueDate,
                          token: token);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
            ))
          ],
        ),
      )),
    );
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
                            FilterModal(
                              filterLabel: 'PK-AJJ',
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
}
