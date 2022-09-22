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
      dateInsert,
      dateClose,
      ddgRef,
      flightNo,
      ataNo,
      seqNo,
      sta,
      staClose,
      subject,
      description,
      category,
      subAta,
      insertProblem,
      techlog,
      status,
      acreg,
      acType,
      statusNo,
      statusDesc,
      staId,
      staCode,
      optionId,
      longName,
      partNbr,
      partName,
      reason,
      categoryDesc,
      dueDateDetail,
      token;

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
    required this.dateInsert,
    required this.dateClose,
    required this.ddgRef,
    required this.flightNo,
    required this.ataNo,
    required this.seqNo,
    required this.sta,
    required this.staClose,
    required this.subject,
    required this.description,
    required this.category,
    required this.subAta,
    required this.insertProblem,
    required this.techlog,
    required this.status,
    required this.acreg,
    required this.acType,
    required this.statusNo,
    required this.statusDesc,
    required this.staId,
    required this.staCode,
    required this.optionId,
    required this.longName,
    required this.partNbr,
    required this.partName,
    required this.reason,
    required this.categoryDesc,
    required this.dueDateDetail,
    required this.token,
  });
  @override
  Widget build(BuildContext context) {
    return cardBackgroundColor == 'High'
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
                    "token": token,
                    "staClose": staClose,
                    "itemId": itemId,
                    "subject": subject,
                    "flightNo": flightNo,
                    "acType": acType,
                    "acReg": acreg,
                    "sta": sta,
                    "ata": ataNo,
                    "seqNo": seqNo,
                    "techlog": techlog,
                    "refDdg": ddgRef,
                    "dateOccur": dateOccur,
                    "dueDate": dueDateDetail,
                    "staCode": staCode,
                    "faultCode": subAta,
                    "category": categoryDesc,
                    "optionStatus": longName,
                    "description": description,
                    "partNum": partNbr,
                    "partName": partName,
                    "reason": reason,
                    "status": statusNo,
                    "optionId": optionId,
                    "staValue": staId,
                    "statusValue": statusNo,
                    "staId": staId,
                  },
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(51, 51, 51, 1),
                                border: Border.all(
                                    color: const Color.fromRGBO(51, 51, 51, 1)),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                ' D ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            )),
                        labelColor == 'Urgent'
                            ? Container(
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
                                ))
                            : labelColor == 'Important'
                                ? Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 181, 178, 12),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 181, 178, 12)),
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
                                    ))
                                : labelColor == 'Urgent & Important'
                                    ? Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            7, 0, 0, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 255, 85, 0),
                                            border:
                                                Border.all(color: const Color.fromARGB(255, 255, 85, 0)),
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
                                        ))
                                    : labelColor == '-'
                                        ? Container(
                                            margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 83, 83, 83), border: Border.all(color: const Color.fromARGB(255, 83, 83, 83)), borderRadius: BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                labelText,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ))
                                        : labelColor == 'Normal'
                                            ? Container(
                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 10, 208), border: Border.all(color: const Color.fromARGB(255, 0, 10, 208)), borderRadius: BorderRadius.circular(8)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    labelText,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                            : Container(
                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(8)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    labelText,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
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
                    margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                    child: Text(
                      info,
                      style: const TextStyle(
                        fontSize: 16,
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
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
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
                ],
              ),
            ),
          )
        : cardBackgroundColor == 'Low'
            ? Card(
                elevation: 0,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: const Color.fromARGB(255, 253, 255, 239),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TaskDetailsPage.routeName,
                      arguments: {
                        "token": token,
                        "staClose": staClose,
                        "itemId": itemId,
                        "subject": subject,
                        "flightNo": flightNo,
                        "acType": acType,
                        "acReg": acreg,
                        "sta": sta,
                        "ata": ataNo,
                        "seqNo": seqNo,
                        "techlog": techlog,
                        "refDdg": ddgRef,
                        "dateOccur": dateOccur,
                        "dueDate": dueDateDetail,
                        "staCode": staCode,
                        "faultCode": subAta,
                        "category": categoryDesc,
                        "optionStatus": longName,
                        "description": description,
                        "partNum": partNbr,
                        "partName": partName,
                        "reason": reason,
                        "status": statusNo,
                        "optionId": optionId,
                        "staValue": staId,
                        "statusValue": statusNo,
                        "staId": staId,
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(51, 51, 51, 1),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            51, 51, 51, 1)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    ' D ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )),
                            labelColor == 'Urgent'
                                ? Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            181, 12, 12, 1),
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
                                    ))
                                : labelColor == 'Important'
                                    ? Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            7, 0, 0, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 181, 178, 12),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 181, 178, 12)),
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
                                        ))
                                    : labelColor == 'Urgent & Important'
                                        ? Container(
                                            margin:
                                                const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 85, 0), border: Border.all(color: const Color.fromARGB(255, 255, 85, 0)), borderRadius: BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                labelText,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ))
                                        : labelColor == '-'
                                            ? Container(
                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 83, 83, 83), border: Border.all(color: const Color.fromARGB(255, 83, 83, 83)), borderRadius: BorderRadius.circular(8)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    labelText,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                            : labelColor == 'Normal'
                                                ? Container(
                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 10, 208), border: Border.all(color: const Color.fromARGB(255, 0, 10, 208)), borderRadius: BorderRadius.circular(8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        labelText,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                : Container(
                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        labelText,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w400,
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
                        margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: Text(
                          info,
                          style: const TextStyle(
                            fontSize: 16,
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
                          margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
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
                    ],
                  ),
                ),
              )
            : cardBackgroundColor == 'Urgent & Important'
                ? Card(
                    elevation: 0,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: const Color.fromARGB(255, 255, 241, 234),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TaskDetailsPage.routeName,
                          arguments: {
                            "token": token,
                            "staClose": staClose,
                            "itemId": itemId,
                            "subject": subject,
                            "flightNo": flightNo,
                            "acType": acType,
                            "acReg": acreg,
                            "sta": sta,
                            "ata": ataNo,
                            "seqNo": seqNo,
                            "techlog": techlog,
                            "refDdg": ddgRef,
                            "dateOccur": dateOccur,
                            "dueDate": dueDateDetail,
                            "staCode": staCode,
                            "faultCode": subAta,
                            "category": categoryDesc,
                            "optionStatus": longName,
                            "description": description,
                            "partNum": partNbr,
                            "partName": partName,
                            "reason": reason,
                            "status": statusNo,
                            "optionId": optionId,
                            "staValue": staId,
                            "statusValue": statusNo,
                            "staId": staId,
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
                            child: Row(
                              children: [
                                Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 7, 0),
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(51, 51, 51, 1),
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                51, 51, 51, 1)),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        ' D ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    )),
                                labelColor == 'Urgent'
                                    ? Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            7, 0, 0, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                181, 12, 12, 1),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    181, 12, 12, 1)),
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
                                        ))
                                    : labelColor == 'Important'
                                        ? Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                7, 0, 0, 0),
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 181, 178, 12),
                                                border: Border.all(
                                                    color:
                                                        const Color.fromARGB(255, 181, 178, 12)),
                                                borderRadius: BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                labelText,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ))
                                        : labelColor == 'Urgent & Important'
                                            ? Container(
                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 85, 0), border: Border.all(color: const Color.fromARGB(255, 255, 85, 0)), borderRadius: BorderRadius.circular(8)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    labelText,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                            : labelColor == '-'
                                                ? Container(
                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 83, 83, 83), border: Border.all(color: const Color.fromARGB(255, 83, 83, 83)), borderRadius: BorderRadius.circular(8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        labelText,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                : labelColor == 'Normal'
                                                    ? Container(
                                                        margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                        decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 10, 208), border: Border.all(color: const Color.fromARGB(255, 0, 10, 208)), borderRadius: BorderRadius.circular(8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            labelText,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                                    : Container(
                                                        margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                        decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            labelText,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        )),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Row(
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400,
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
                            margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text(
                              info,
                              style: const TextStyle(
                                fontSize: 16,
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
                              margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
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
                        ],
                      ),
                    ),
                  )
                : cardBackgroundColor == 'Important'
                    ? Card(
                        elevation: 0,
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        color: const Color.fromARGB(255, 255, 253, 239),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              TaskDetailsPage.routeName,
                              arguments: {
                                "token": token,
                                "staClose": staClose,
                                "itemId": itemId,
                                "subject": subject,
                                "flightNo": flightNo,
                                "acType": acType,
                                "acReg": acreg,
                                "sta": sta,
                                "ata": ataNo,
                                "seqNo": seqNo,
                                "techlog": techlog,
                                "refDdg": ddgRef,
                                "dateOccur": dateOccur,
                                "dueDate": dueDateDetail,
                                "staCode": staCode,
                                "faultCode": subAta,
                                "category": categoryDesc,
                                "optionStatus": longName,
                                "description": description,
                                "partNum": partNbr,
                                "partName": partName,
                                "reason": reason,
                                "status": statusNo,
                                "optionId": optionId,
                                "staValue": staId,
                                "statusValue": statusNo,
                                "staId": staId,
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 0, 5),
                                child: Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 7, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                51, 51, 51, 1),
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            ' D ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        )),
                                    labelColor == 'Urgent'
                                        ? Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                7, 0, 0, 0),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    181, 12, 12, 1),
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        181, 12, 12, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                labelText,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ))
                                        : labelColor == 'Important'
                                            ? Container(
                                                margin: const EdgeInsets.fromLTRB(
                                                    7, 0, 0, 0),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 181, 178, 12),
                                                    border:
                                                        Border.all(color: const Color.fromARGB(255, 181, 178, 12)),
                                                    borderRadius: BorderRadius.circular(8)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    labelText,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                            : labelColor == 'Urgent & Important'
                                                ? Container(
                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 85, 0), border: Border.all(color: const Color.fromARGB(255, 255, 85, 0)), borderRadius: BorderRadius.circular(8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        labelText,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                : labelColor == '-'
                                                    ? Container(
                                                        margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                        decoration: BoxDecoration(color: const Color.fromARGB(255, 83, 83, 83), border: Border.all(color: const Color.fromARGB(255, 83, 83, 83)), borderRadius: BorderRadius.circular(8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            labelText,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                                    : labelColor == 'Normal'
                                                        ? Container(
                                                            margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 10, 208), border: Border.all(color: const Color.fromARGB(255, 0, 10, 208)), borderRadius: BorderRadius.circular(8)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                labelText,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ))
                                                        : Container(
                                                            margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(8)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                labelText,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
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
                                margin: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                                child: Text(
                                  info,
                                  style: const TextStyle(
                                    fontSize: 16,
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
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 40, 0),
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
                                              color: Color.fromRGBO(
                                                  224, 13, 13, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          40, 0, 0, 0),
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
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 5, 15, 20),
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
                            ],
                          ),
                        ),
                      )
                    : cardBackgroundColor == 'Normal'
                        ? Card(
                            elevation: 0,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            color: const Color.fromARGB(255, 238, 239, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  TaskDetailsPage.routeName,
                                  arguments: {
                                    "token": token,
                                    "staClose": staClose,
                                    "itemId": itemId,
                                    "subject": subject,
                                    "flightNo": flightNo,
                                    "acType": acType,
                                    "acReg": acreg,
                                    "sta": sta,
                                    "ata": ataNo,
                                    "seqNo": seqNo,
                                    "techlog": techlog,
                                    "refDdg": ddgRef,
                                    "dateOccur": dateOccur,
                                    "dueDate": dueDateDetail,
                                    "staCode": staCode,
                                    "faultCode": subAta,
                                    "category": categoryDesc,
                                    "optionStatus": longName,
                                    "description": description,
                                    "partNum": partNbr,
                                    "partName": partName,
                                    "reason": reason,
                                    "status": statusNo,
                                    "optionId": optionId,
                                    "staValue": staId,
                                    "statusValue": statusNo,
                                    "staId": staId,
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 5),
                                    child: Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 7, 0),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    51, 51, 51, 1),
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        51, 51, 51, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                ' D ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            )),
                                        labelColor == 'Urgent'
                                            ? Container(
                                                margin: const EdgeInsets.fromLTRB(
                                                    7, 0, 0, 0),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        181, 12, 12, 1),
                                                    border: Border.all(
                                                        color: const Color.fromRGBO(
                                                            181, 12, 12, 1)),
                                                    borderRadius: BorderRadius.circular(
                                                        8)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    labelText,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                            : labelColor == 'Important'
                                                ? Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        7, 0, 0, 0),
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromARGB(255, 181, 178, 12),
                                                        border: Border.all(color: const Color.fromARGB(255, 181, 178, 12)),
                                                        borderRadius: BorderRadius.circular(8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        labelText,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                : labelColor == 'Urgent & Important'
                                                    ? Container(
                                                        margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                        decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 85, 0), border: Border.all(color: const Color.fromARGB(255, 255, 85, 0)), borderRadius: BorderRadius.circular(8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            labelText,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                                    : labelColor == '-'
                                                        ? Container(
                                                            margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 83, 83, 83), border: Border.all(color: const Color.fromARGB(255, 83, 83, 83)), borderRadius: BorderRadius.circular(8)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                labelText,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ))
                                                        : labelColor == 'Normal'
                                                            ? Container(
                                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 10, 208), border: Border.all(color: const Color.fromARGB(255, 0, 10, 208)), borderRadius: BorderRadius.circular(8)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    labelText,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ))
                                                            : Container(
                                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(8)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    labelText,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 0, 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          title,
                                          style: const TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
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
                                    margin:
                                        const EdgeInsets.fromLTRB(15, 5, 0, 5),
                                    child: Text(
                                      info,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(1, 98, 153, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 0, 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 40, 0),
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
                                                  color: Color.fromRGBO(
                                                      224, 13, 13, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              40, 0, 0, 0),
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
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 5, 15, 20),
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
                                ],
                              ),
                            ),
                          )
                        : cardBackgroundColor == '-'
                            ? Card(
                                elevation: 0,
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                color: const Color.fromARGB(255, 233, 233, 233),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      TaskDetailsPage.routeName,
                                      arguments: {
                                        "token": token,
                                        "staClose": staClose,
                                        "itemId": itemId,
                                        "subject": subject,
                                        "flightNo": flightNo,
                                        "acType": acType,
                                        "acReg": acreg,
                                        "sta": sta,
                                        "ata": ataNo,
                                        "seqNo": seqNo,
                                        "techlog": techlog,
                                        "refDdg": ddgRef,
                                        "dateOccur": dateOccur,
                                        "dueDate": dueDateDetail,
                                        "staCode": staCode,
                                        "faultCode": subAta,
                                        "category": categoryDesc,
                                        "optionStatus": longName,
                                        "description": description,
                                        "partNum": partNbr,
                                        "partName": partName,
                                        "reason": reason,
                                        "status": statusNo,
                                        "optionId": optionId,
                                        "staValue": staId,
                                        "statusValue": statusNo,
                                        "staId": staId,
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 0, 5),
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 7, 0),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        51, 51, 51, 1),
                                                    border: Border.all(
                                                        color: const Color
                                                                .fromRGBO(
                                                            51, 51, 51, 1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    ' D ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                            labelColor == 'Urgent'
                                                ? Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        7, 0, 0, 0),
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromRGBO(
                                                            181, 12, 12, 1),
                                                        border: Border.all(
                                                            color: const Color.fromRGBO(
                                                                181, 12, 12, 1)),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        labelText,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                : labelColor == 'Important'
                                                    ? Container(
                                                        margin: const EdgeInsets.fromLTRB(
                                                            7, 0, 0, 0),
                                                        decoration:
                                                            BoxDecoration(color: const Color.fromARGB(255, 181, 178, 12), border: Border.all(color: const Color.fromARGB(255, 181, 178, 12)), borderRadius: BorderRadius.circular(8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            labelText,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                                    : labelColor == 'Urgent & Important'
                                                        ? Container(
                                                            margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 85, 0), border: Border.all(color: const Color.fromARGB(255, 255, 85, 0)), borderRadius: BorderRadius.circular(8)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                labelText,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ))
                                                        : labelColor == '-'
                                                            ? Container(
                                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 83, 83, 83), border: Border.all(color: const Color.fromARGB(255, 83, 83, 83)), borderRadius: BorderRadius.circular(8)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    labelText,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ))
                                                            : labelColor == 'Normal'
                                                                ? Container(
                                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 10, 208), border: Border.all(color: const Color.fromARGB(255, 0, 10, 208)), borderRadius: BorderRadius.circular(8)),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        labelText,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            color: Colors.white),
                                                                      ),
                                                                    ))
                                                                : Container(
                                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(8)),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        labelText,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            color: Colors.white),
                                                                      ),
                                                                    )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              title,
                                              style: const TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  15, 0, 15, 0),
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
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 5),
                                        child: Text(
                                          info,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(1, 98, 153, 1),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 40, 0),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Due: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    dueDate,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color.fromRGBO(
                                                          224, 13, 13, 1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Issue: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    dateInsert,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                          margin: const EdgeInsets.fromLTRB(
                                              15, 5, 15, 20),
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
                                    ],
                                  ),
                                ),
                              )
                            : Card(
                                elevation: 0,
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                color: Color.fromARGB(255, 239, 239, 239),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      TaskDetailsPage.routeName,
                                      arguments: {
                                        "token": token,
                                        "staClose": staClose,
                                        "itemId": itemId,
                                        "subject": subject,
                                        "flightNo": flightNo,
                                        "acType": acType,
                                        "acReg": acreg,
                                        "sta": sta,
                                        "ata": ataNo,
                                        "seqNo": seqNo,
                                        "techlog": techlog,
                                        "refDdg": ddgRef,
                                        "dateOccur": dateOccur,
                                        "dueDate": dueDateDetail,
                                        "staCode": staCode,
                                        "faultCode": subAta,
                                        "category": categoryDesc,
                                        "optionStatus": longName,
                                        "description": description,
                                        "partNum": partNbr,
                                        "partName": partName,
                                        "reason": reason,
                                        "status": statusNo,
                                        "optionId": optionId,
                                        "staValue": staId,
                                        "statusValue": statusNo,
                                        "staId": staId,
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 0, 5),
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 7, 0),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        51, 51, 51, 1),
                                                    border: Border.all(
                                                        color: const Color
                                                                .fromRGBO(
                                                            51, 51, 51, 1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    ' D ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                            labelColor == 'Urgent'
                                                ? Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        7, 0, 0, 0),
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromRGBO(
                                                            181, 12, 12, 1),
                                                        border: Border.all(
                                                            color: const Color.fromRGBO(
                                                                181, 12, 12, 1)),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        labelText,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                : labelColor == 'Important'
                                                    ? Container(
                                                        margin: const EdgeInsets.fromLTRB(
                                                            7, 0, 0, 0),
                                                        decoration:
                                                            BoxDecoration(color: const Color.fromARGB(255, 181, 178, 12), border: Border.all(color: const Color.fromARGB(255, 181, 178, 12)), borderRadius: BorderRadius.circular(8)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            labelText,
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                                    : labelColor == 'Urgent & Important'
                                                        ? Container(
                                                            margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 85, 0), border: Border.all(color: const Color.fromARGB(255, 255, 85, 0)), borderRadius: BorderRadius.circular(8)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                labelText,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ))
                                                        : labelColor == '-'
                                                            ? Container(
                                                                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                decoration: BoxDecoration(color: const Color.fromARGB(255, 83, 83, 83), border: Border.all(color: const Color.fromARGB(255, 83, 83, 83)), borderRadius: BorderRadius.circular(8)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    labelText,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ))
                                                            : labelColor == 'Normal'
                                                                ? Container(
                                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 10, 208), border: Border.all(color: const Color.fromARGB(255, 0, 10, 208)), borderRadius: BorderRadius.circular(8)),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        labelText,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            color: Colors.white),
                                                                      ),
                                                                    ))
                                                                : Container(
                                                                    margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255), border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(8)),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        labelText,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                255,
                                                                                0,
                                                                                0)),
                                                                      ),
                                                                    )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              title,
                                              style: const TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  15, 0, 15, 0),
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
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 5),
                                        child: Text(
                                          info,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(1, 98, 153, 1),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 0, 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 40, 0),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Due: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    dueDate,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color.fromRGBO(
                                                          224, 13, 13, 1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  40, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Issue: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    dateInsert,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                          margin: const EdgeInsets.fromLTRB(
                                              15, 5, 15, 20),
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
                                    ],
                                  ),
                                ),
                              );
  }
}
