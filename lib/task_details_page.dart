import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hil_mobile/follow_on_list_page.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  List<DropdownMenuItem<String>> get dropdownStatus {
    List<DropdownMenuItem<String>> menuStatus = [
      DropdownMenuItem(child: Text("Open"), value: "Open"),
      DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuStatus;
  }

  List<DropdownMenuItem<String>> get dropdownStation {
    List<DropdownMenuItem<String>> menuStation = [
      DropdownMenuItem(child: Text("Open"), value: "Open"),
      DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuStation;
  }
  
  List<DropdownMenuItem<String>> get dropdownOption {
    List<DropdownMenuItem<String>> menuOption = [
      DropdownMenuItem(child: Text("Open"), value: "Open"),
      DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuOption;
  }

  String selectedStatus = "Open";
  String selectedStation = "Open";
  String selectedOption = "Open";

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 35,
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Item ID',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1888239023',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 22,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Due Status',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0, 0, 10, 0),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(
                                            181, 12, 12, 1),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                181, 12, 12, 1)),
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(5.0),
                                      child: Text(
                                        ' H ',
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '3 Days Left',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromRGBO(
                                          181, 12, 12, 1)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'on 22 Apr 2022',
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          181, 12, 12, 1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black38,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subject'),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Equipment & Furnishing',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Flight Number'),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'QG975',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('A/C Type'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'A320-C',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date Occur'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('A/C Registration'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'PK-GJJ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Due Date'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '2022-04-22, 00:00 WIB',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Station'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'CGK',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Station Code'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ATA'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '23',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Fault.Code'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '51',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Seq. Number'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '68',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Category'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('TECHLOG'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'TLI0304681',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Option Status'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('REF'),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'AML',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('REF.DDG'),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '23-52-05A',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black38,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description'),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black38,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Part Number'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'ACP2345234A',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Part Name'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'AUDIO CONTROL PANEL',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(1, 98, 153, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 30),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reason'),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'NIL SPARE',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(1, 98, 153, 1),
                    minimumSize: Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Text(
                  'Add Follow On',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                    primary: Colors.white,
                    minimumSize: Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return FollowOnListPage();
                  }));
                },
                child: Text(
                  'Check Date Follow On',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(1, 98, 153, 1)),
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            // color: Colors.b,
            border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(219, 219, 219, 1),
                    width: 1.0))),
        height: 60,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width / 3.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      side: BorderSide(
                          color: Color.fromRGBO(239, 173, 66, 1)),
                      primary: Color.fromRGBO(239, 173, 66, 1),
                      minimumSize: Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    changeStatusModal(context);
                  },
                  child: Text('Change Status')),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width / 3.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      side: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(239, 173, 66, 1)),
                      primary: Colors.white,
                      minimumSize: Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    changeOptionModal(context);
                  },
                  child: Text(
                    'Change Option',
                    style: TextStyle(
                        color: Color.fromRGBO(239, 173, 66, 1)),
                  )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width / 3.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      side: BorderSide(
                          color: Color.fromRGBO(219, 219, 219, 1)),
                      primary: Color.fromRGBO(219, 219, 219, 1),
                      minimumSize: Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Text(
                    'Download',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> changeStatusModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) {
            return Container(
              height: 600,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 15, 0, 10),
                        child: Text('Change HIL Status',
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
                                EdgeInsets.fromLTRB(0, 15, 15, 10),
                            child: Icon(Icons.close)),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Change Description')),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Type a description',
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: Text('Change Status to')),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(
                                          226, 234, 239, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(
                                          226, 234, 239, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor:
                                    Color.fromRGBO(226, 234, 239, 1),
                                contentPadding: EdgeInsets.all(13)),
                            value: selectedStatus,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedStatus = newValue!;
                              });
                            },
                            items: dropdownStatus),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: Text('Station Close')),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(
                                          226, 234, 239, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(
                                          226, 234, 239, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor:
                                    Color.fromRGBO(226, 234, 239, 1),
                                contentPadding: EdgeInsets.all(13)),
                            value: selectedStation,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedStation = newValue!;
                              });
                            },
                            items: dropdownStation)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(1, 98, 153, 1),
                          minimumSize: Size.fromHeight(45),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
  }

  Future<dynamic> changeOptionModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) {
            return Container(
              height: 310,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 15, 0, 10),
                        child: Text('Change HIL Option',
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
                                EdgeInsets.fromLTRB(0, 15, 15, 10),
                            child: Icon(Icons.close)),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Change Option to')),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(
                                          226, 234, 239, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(
                                          226, 234, 239, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor:
                                    Color.fromRGBO(226, 234, 239, 1),
                                contentPadding: EdgeInsets.all(13)),
                            value: selectedOption,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption = newValue!;
                              });
                            },
                            items: dropdownOption),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(1, 98, 153, 1),
                          minimumSize: Size.fromHeight(45),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
  }
}
