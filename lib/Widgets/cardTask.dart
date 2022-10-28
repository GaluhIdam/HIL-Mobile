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
      lastFollow,
      option;

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
    required this.option,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
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
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          color: cardBackgroundColor == 'HIGH'
              ? Color.fromRGBO(255, 239, 239, 1)
              : cardBackgroundColor == 'MEDIUM'
                  ? Color.fromARGB(255, 255, 239, 226)
                  : cardBackgroundColor == 'LOW'
                      ? Color.fromARGB(255, 255, 248, 224)
                      : Color.fromARGB(255, 241, 241, 241),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(51, 51, 51, 1),
                                border: Border.all(
                                    color: const Color.fromRGBO(51, 51, 51, 1)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: EdgeInsets.all(7.5),
                              child: Text(
                                categoryDesc,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                            decoration: BoxDecoration(
                                color: cardBackgroundColor == 'HIGH'
                                    ? Color.fromARGB(255, 189, 0, 0)
                                    : cardBackgroundColor == 'MEDIUM'
                                        ? Color.fromARGB(255, 255, 116, 16)
                                        : cardBackgroundColor == 'LOW'
                                            ? Color.fromRGBO(255, 200, 16, 1)
                                            : Color.fromARGB(
                                                255, 149, 149, 149),
                                border: Border.all(
                                  color: cardBackgroundColor == 'HIGH'
                                      ? Color.fromARGB(255, 189, 0, 0)
                                      : cardBackgroundColor == 'MEDIUM'
                                          ? Color.fromARGB(255, 255, 116, 16)
                                          : cardBackgroundColor == 'LOW'
                                              ? Color.fromRGBO(255, 200, 16, 1)
                                              : Color.fromARGB(
                                                  255, 149, 149, 149),
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: Text(
                                labelText,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Text(
                        option == '1'
                            ? 'MS'
                            : option == '2'
                                ? 'TS'
                                : option == '3'
                                    ? 'UMR'
                                    : option == '4'
                                        ? 'MAT'
                                        : '-',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
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
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 5),
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
                padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Due : ',
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
                    Text(
                      'Due Date: $dateInsert',
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
                  margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
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
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Last Follow :',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
        ));
  }
}
