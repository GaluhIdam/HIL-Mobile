import 'package:flutter/material.dart';

class DetailTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 35,
              )),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Due Status',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(181, 12, 12, 1),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            181, 12, 12, 1)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    ' H ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '3 Days Left',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(181, 12, 12, 1)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'on 22 Apr 2022',
                              style: TextStyle(
                                  color: Color.fromRGBO(181, 12, 12, 1)),
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
        const Divider(
          color: Colors.black38,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Subject'),
              SizedBox(
                height: 7,
              ),
              Text(
                'Equipment & Furnishing',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Flight Number'),
              SizedBox(
                height: 7,
              ),
              Text(
                'QG975',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('A/C Type'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'A320-C',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Date Occur'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('A/C Registration'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'PK-GJJ',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Due Date'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '2022-04-22, 00:00 WIB',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Station'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'CGK',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Station Code'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('ATA'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '23',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Fault.Code'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '51',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Seq. Number'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '68',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Category'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('TECHLOG'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'TLI0304681',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Option Status'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '-',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('REF'),
              SizedBox(
                height: 7,
              ),
              Text(
                'AML',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('REF.DDG'),
              SizedBox(
                height: 7,
              ),
              Text(
                '23-52-05A',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black38,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Description'),
              SizedBox(
                height: 7,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black38,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Part Number'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'ACP2345234A',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Part Name'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'AUDIO CONTROL PANEL',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Reason'),
              SizedBox(
                height: 7,
              ),
              Text(
                'NIL SPARE',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(1, 98, 153, 1),
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              // addFollowOnModal(context);
            },
            child: const Text(
              'Add Follow On',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: const BorderSide(
                    width: 1, color: Color.fromRGBO(1, 98, 153, 1)),
                primary: Colors.white,
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const FollowOnListPage();
              // }));
            },
            child: const Text(
              'Check Date Follow On',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(1, 98, 153, 1)),
            ),
          ),
        ),
      ],
    );
  }
}
