import 'package:flutter/material.dart';
import '../Pages/task_details_page.dart';

class TaskCard extends StatelessWidget {
  final dynamic id,
      cardBackgroundColor,
      labelColor,
      labelText,
      title,
      code,
      info,
      itemId,
      dateOccur,
      dueDate,
      token,
      dateInsert,
      description,
      categoryDesc,
      statusDue,
      lastFollow;

  const TaskCard({
    super.key,
    required this.id,
    required this.cardBackgroundColor,
    required this.labelColor,
    required this.labelText,
    required this.title,
    required this.code,
    required this.info,
    required this.itemId,
    required this.dateOccur,
    required this.dueDate,
    required this.token,
    required this.dateInsert,
    required this.description,
    required this.categoryDesc,
    required this.statusDue,
    required this.lastFollow,
  });
  @override
  Widget build(BuildContext context) {
    return cardBackgroundColor == 'HIGH'
        ? Card(
            elevation: 0,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: const Color.fromRGBO(255, 239, 239, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TaskDetailsPage.routeName,
                  arguments: {
                    "itemId": itemId,
                    "dueStatus": statusDue,
                    "priority": cardBackgroundColor
                  },
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(51, 51, 51, 1),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            51, 51, 51, 1)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    categoryDesc,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(181, 12, 12, 1),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            181, 12, 12, 1)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    labelText,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: const Text(
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
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                    child: Text(
                      info,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(1, 98, 153, 1),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                          child: Row(
                            children: [
                              const Text(
                                'Due: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                dueDate,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(224, 13, 13, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Row(
                            children: [
                              const Text(
                                'Issue: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                dateInsert,
                                style: const TextStyle(
                                  fontSize: 12,
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
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          description,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 3),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Last Follow :',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          lastFollow.toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          )
        : cardBackgroundColor == "MEDIUM"
            ? Card(
                elevation: 0,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Color.fromARGB(255, 255, 239, 226),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TaskDetailsPage.routeName,
                      arguments: {
                        "itemId": itemId,
                        "dueStatus": statusDue,
                        "priority": cardBackgroundColor
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(51, 51, 51, 1),
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                51, 51, 51, 1)),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        categoryDesc,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    )),
                                Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 116, 16),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 255, 116, 16)),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        labelText,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: const Text(
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
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          info,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(1, 98, 153, 1),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Due: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    dueDate,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(224, 13, 13, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Issue: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    dateInsert,
                                    style: const TextStyle(
                                      fontSize: 12,
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
                          margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              description,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 5, 15, 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Last Follow :',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              lastFollow,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            : cardBackgroundColor == "LOW"
                ? Card(
                    elevation: 0,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Color.fromARGB(255, 255, 248, 224),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TaskDetailsPage.routeName,
                          arguments: {
                            "itemId": itemId,
                            "dueStatus": statusDue,
                            "priority": cardBackgroundColor
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                51, 51, 51, 1),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            categoryDesc,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        )),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            7, 0, 0, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                255, 200, 16, 1),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    255, 200, 16, 1)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            labelText,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                            child: Row(
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: const Text(
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
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text(
                              info,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(1, 98, 153, 1),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Due: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        dueDate,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(224, 13, 13, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Issue: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        dateInsert,
                                        style: const TextStyle(
                                          fontSize: 12,
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
                              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  description,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(15, 5, 15, 3),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Last Follow :',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    )),
                              )),
                          Container(
                              margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  lastFollow.toString(),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                : Card(
                    elevation: 0,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Color.fromARGB(255, 241, 241, 241),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TaskDetailsPage.routeName,
                          arguments: {
                            "itemId": itemId,
                            "dueStatus": statusDue,
                            "priority": cardBackgroundColor
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                51, 51, 51, 1),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            categoryDesc,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        )),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            7, 0, 0, 0),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 149, 149, 149),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 149, 149, 149)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            labelText,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                            child: Row(
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: const Text(
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
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text(
                              info,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(1, 98, 153, 1),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Due: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        dueDate,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(224, 13, 13, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Issue: ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        dateInsert,
                                        style: const TextStyle(
                                          fontSize: 12,
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
                              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  description,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(15, 5, 15, 3),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Last Follow :',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    )),
                              )),
                          Container(
                              margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  lastFollow.toString(),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
  }
}
