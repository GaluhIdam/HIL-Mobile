import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FollowOnListPage extends StatelessWidget {
  const FollowOnListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 35,
                        ),
                        Text(
                          ' 1888239023',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              ),
            ),
            buildCard(context, '1'),
            buildCard(context, '2'),
            buildCard(context, '3'),
          ],
        ),
      )),
    );
  }

  Card buildCard(BuildContext context, label_number) {
    return Card(
            elevation: 0,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: Color.fromRGBO(237, 247, 253, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.circular(7)),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                                child: Text(
                                  label_number,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context)
                                        .size
                                        .width /
                                    2.5,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date FO',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              134, 134, 134, 1)),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '2022-09-04',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context)
                                        .size
                                        .width /
                                    2.5,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'By',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              134, 134, 134, 1)),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Vega Rendra Saputra',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context)
                                        .size
                                        .width /
                                    2.5,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Unit',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              134, 134, 134, 1)),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'TVE',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context)
                                        .size
                                        .width /
                                    2.5,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Next Unit',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              134, 134, 134, 1)),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'TCD',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text('Follow On',
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        134, 134, 134, 1))),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
