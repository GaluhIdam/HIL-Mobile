import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hil_mobile/filter_modal.dart';
import 'package:hil_mobile/task_details_page.dart';

class TaskToDoPage extends StatefulWidget {
  const TaskToDoPage({Key? key}) : super(key: key);

  @override
  State<TaskToDoPage> createState() => _TaskToDoPageState();
}

enum SortBy { due, issue }

class _TaskToDoPageState extends State<TaskToDoPage> {
  SortBy? _value = SortBy.due;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: ListView(
            children: [
              Container(
                  width: double.infinity,
                  child: Text(
                    'Good Morning,',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(1, 98, 153, 1),
                    ),
                  )),
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
                      backgroundColor:
                          Color.fromRGBO(209, 214, 217, 1),
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
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  children: [
                    Flexible(
                        child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor:
                              Color.fromRGBO(1, 98, 153, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(1, 98, 153, 1)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(14),
                          hintText: 'Masukan kata kunci'),
                    )),
                    filterData(context),
                    sortData(context),
                  ],
                ),
              ),
              buildCard(
                  Color.fromRGBO(255, 239, 239, 1),
                  Color.fromRGBO(181, 12, 12, 1),
                  'High',
                  'PK-GJJ',
                  '1888239023',
                  'Equipment & Furnishing',
                  '3 Days Left',
                  '10 Dec 2021',
                  'LOREM IPSUM DOLOR SIT AMET, CONSETETUR SADIPSCING ELITR, SED DIAM NONUMY EIRMOD TEMPOR INVIDUNT UT LABORE ET DOLORE.'),
              buildCard(
                  Color.fromRGBO(253, 246, 227, 1),
                  Color.fromRGBO(255, 200, 16, 1),
                  'Low | UMR',
                  'PK-GPW',
                  '1888239023',
                  'Lights',
                  '20 Apr 2022',
                  '10 Dec 2021',
                  'LOREM IPSUM DOLOR SIT AMET, CONSETETUR SADIPSCING ELITR, SED DIAM NONUMY EIRMOD TEMPOR INVIDUNT UT LABORE ET DOLORE.'),
              buildCard(
                  Color.fromRGBO(242, 242, 242, 1),
                  Color.fromRGBO(159, 159, 159, 1),
                  'NON',
                  'PK-GJJ',
                  '1888239023',
                  'Equipment & Furnishing',
                  '20 Apr 2022',
                  '10 Dec 2021',
                  'LOREM IPSUM DOLOR SIT AMET, CONSETETUR SADIPSCING ELITR, SED DIAM NONUMY EIRMOD TEMPOR INVIDUNT UT LABORE ET DOLORE.'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/task_to_do_active.png'),
              width: 35,
              height: 40,
            ),
            label: 'Task To Do',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/hil_management.png'),
              width: 35,
            ),
            label: 'HIL Management',
          ),
        ],
        selectedItemColor: Color.fromRGBO(1, 98, 153, 1),
      ),
    );
  }

  GestureDetector filterData(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, setState) {
                return Container(
                  height: 700,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
                            child: Text('Filter',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Color.fromRGBO(1, 98, 153, 1),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin:
                                    EdgeInsets.fromLTRB(0, 25, 25, 0),
                                child: Icon(Icons.close)),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(25, 20, 0, 10),
                          width: double.infinity,
                          child: Text(
                            'Priority',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 40.0,
                        margin: EdgeInsets.fromLTRB(25, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FilterModal(
                              filterLabel: 'High',
                              backgroundColor:
                                  Color.fromRGBO(181, 12, 12, 1),
                              selectedColor:
                                  Color.fromRGBO(181, 12, 12, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Low',
                              backgroundColor:
                                  Color.fromRGBO(255, 200, 16, 1),
                              selectedColor:
                                  Color.fromRGBO(255, 200, 16, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Non',
                              backgroundColor:
                                  Color.fromRGBO(159, 159, 159, 1),
                              selectedColor:
                                  Color.fromRGBO(159, 159, 159, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(25, 15, 0, 10),
                          width: double.infinity,
                          child: Text(
                            'A/C Registration',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 30.0,
                        margin: EdgeInsets.fromLTRB(25, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FilterModal(
                              filterLabel: 'PK-GJJ',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-GWL',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-JJK',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-WWG',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-AJJ',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(25, 15, 0, 10),
                          width: double.infinity,
                          child: Text(
                            'Subject',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 30.0,
                        margin: EdgeInsets.fromLTRB(25, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FilterModal(
                              filterLabel: 'Light',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Equipment & Furnishing',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Cabin',
                              selectedColor:
                                  Color.fromRGBO(1, 98, 153, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 15, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    Color.fromRGBO(66, 66, 66, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(8))),
                            onPressed: () {},
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(1, 98, 153, 1),
                              minimumSize: Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10))),
                          onPressed: () {},
                          child: Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
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
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
              return StatefulBuilder(
                  builder: (BuildContext context, setState) {
                return Container(
                  height: 320,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.fromLTRB(25, 25, 0, 10),
                            child: Text('Sort',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Color.fromRGBO(1, 98, 153, 1),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    0, 25, 25, 10),
                                child: Icon(Icons.close)),
                          )
                        ],
                      ),
                      Container(
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
                        margin: EdgeInsets.all(25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(1, 98, 153, 1),
                              minimumSize: Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10))),
                          onPressed: () {},
                          child: Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.sort_by_alpha,
              size: 30,
              color: Color.fromRGBO(1, 98, 153, 1),
            ),
          )),
    );
  }

  Card buildCard(card_background_color, label_color, label_text,
      title, code, info, due_date, issue_date, description) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      color: card_background_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return TaskDetailsPage();
          }));
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(51, 51, 51, 1),
                          border: Border.all(
                              color: Color.fromRGBO(51, 51, 51, 1)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' D ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                      decoration: BoxDecoration(
                          color: label_color,
                          border: Border.all(color: label_color),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          label_text,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      '|',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    code,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Text(
                info,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(1, 98, 153, 1),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: Row(
                      children: [
                        Text(
                          'Due: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          due_date,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(224, 13, 13, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          'Issue: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          issue_date,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 0, 15),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
