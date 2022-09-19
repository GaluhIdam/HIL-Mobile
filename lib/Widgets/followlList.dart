import 'package:flutter/material.dart';

class FollowListCard extends StatelessWidget {
  final String dateFO, unit, byPerson, nextUnit, followOn;
  final int labelNumber;
  const FollowListCard(
      {super.key,
      required this.labelNumber,
      required this.dateFO,
      required this.unit,
      required this.byPerson,
      required this.nextUnit,
      required this.followOn});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      color: Color.fromRGBO(237, 247, 253, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                          child: Text(
                            labelNumber.toString(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date FO',
                                style: TextStyle(
                                    color: Color.fromRGBO(134, 134, 134, 1)),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                dateFO,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'By',
                                style: TextStyle(
                                    color: Color.fromRGBO(134, 134, 134, 1)),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                byPerson,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Unit',
                                style: TextStyle(
                                    color: Color.fromRGBO(134, 134, 134, 1)),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                unit,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Next Unit',
                                style: TextStyle(
                                    color: Color.fromRGBO(134, 134, 134, 1)),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                nextUnit,
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
                  margin: EdgeInsets.fromLTRB(5, 20, 5, 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Follow On',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1))),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        followOn,
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
