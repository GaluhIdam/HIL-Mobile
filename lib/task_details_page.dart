import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
                      width:
                          MediaQuery.of(context).size.width / 2.5,
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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 80),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(1, 98, 153, 1)),
                    primary: Colors.white,
                    minimumSize: Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
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
            border: Border(top: BorderSide(color: Color.fromRGBO(219, 219, 219, 1), width: 1.0))),
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
                  onPressed: () {},
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
                  onPressed: () {},
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
}
