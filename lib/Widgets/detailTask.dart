import 'package:flutter/material.dart';
import 'package:hil_mobile/Pages/follow_on_list_page.dart';
import 'package:hil_mobile/Services/followService.dart';

class DetailTask extends StatelessWidget {
  final String itemId,
      subject,
      flightNumber,
      aircraftType,
      aircraftRegistration,
      station,
      ata,
      sequenceNumber,
      dateOccured,
      dueDate,
      stationCode,
      faultCode,
      categoryName,
      techlog,
      ref,
      refDdg,
      optionStatus,
      description,
      partNumber,
      partName,
      statusName,
      optionName;

  const DetailTask({
    required this.itemId,
    required this.subject,
    required this.flightNumber,
    required this.aircraftType,
    required this.aircraftRegistration,
    required this.station,
    required this.ata,
    required this.sequenceNumber,
    required this.dateOccured,
    required this.dueDate,
    required this.stationCode,
    required this.faultCode,
    required this.categoryName,
    required this.techlog,
    required this.ref,
    required this.refDdg,
    required this.optionStatus,
    required this.description,
    required this.partNumber,
    required this.partName,
    required this.statusName,
    required this.optionName,
  });

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
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Item ID',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      itemId,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 22,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
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
                          children: <Widget>[
                            optionName == 'Urgent'
                                ? Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            181, 12, 12, 1),
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
                                    ))
                                : optionName == 'Important'
                                    ? Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 253, 255, 239),
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 253, 255, 239),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            ' H ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ))
                                    : optionName == 'Urgent & Important'
                                        ? Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 241, 234),
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 255, 241, 234),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                ' H ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ))
                                        : optionName == 'Important'
                                            ? Container(
                                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(255, 255, 253, 239),
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              253,
                                                              239),
                                                    ),
                                                    borderRadius: BorderRadius.circular(8)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    ' H ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  ),
                                                ))
                                            : optionName == 'Normal'
                                                ? Container(
                                                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromARGB(255, 238, 239, 255),
                                                        border: Border.all(
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              238, 239, 255),
                                                        ),
                                                        borderRadius: BorderRadius.circular(8)),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Text(
                                                        ' H ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ))
                                                : optionName == '-'
                                                    ? Container(
                                                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                        decoration: BoxDecoration(
                                                            color: const Color.fromARGB(255, 233, 233, 233),
                                                            border: Border.all(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  233,
                                                                  233,
                                                                  233),
                                                            ),
                                                            borderRadius: BorderRadius.circular(8)),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Text(
                                                            ' H ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ))
                                                    : Container(
                                                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                        decoration: BoxDecoration(
                                                            color: const Color.fromARGB(255, 233, 233, 233),
                                                            border: Border.all(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  233,
                                                                  233,
                                                                  233),
                                                            ),
                                                            borderRadius: BorderRadius.circular(8)),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Text(
                                                            ' H ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        )),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              statusName,
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromRGBO(181, 12, 12, 1)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              dueDate,
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
            children: <Widget>[
              Text('Subject'),
              SizedBox(
                height: 7,
              ),
              Text(
                subject,
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
            children: <Widget>[
              Text('Flight Number'),
              SizedBox(
                height: 7,
              ),
              Text(
                flightNumber,
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
                    children: <Widget>[
                      Text('A/C Type'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        aircraftType,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Date Occur'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        dateOccured,
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
                    children: <Widget>[
                      Text('A/C Registration'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        aircraftRegistration,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Due Date'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        dueDate,
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
                    children: <Widget>[
                      Text('Station'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        station,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Station Code'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        stationCode,
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
                    children: <Widget>[
                      Text('ATA'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        ata,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Fault.Code'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        faultCode,
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
                    children: <Widget>[
                      Text('Seq. Number'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        sequenceNumber,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Category'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        categoryName,
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
                    children: <Widget>[
                      Text('TECHLOG'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        techlog,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Option Status'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        optionStatus,
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
            children: <Widget>[
              Text('REF'),
              SizedBox(
                height: 7,
              ),
              Text(
                ref,
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
            children: <Widget>[
              Text('REF.DDG'),
              SizedBox(
                height: 7,
              ),
              Text(
                refDdg,
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
            children: <Widget>[
              Text('Description'),
              SizedBox(
                height: 7,
              ),
              Text(
                description,
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
                    children: <Widget>[
                      Text('Part Number'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        partNumber,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(1, 98, 153, 1)),
                      ),
                    ],
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Part Name'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        partName,
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
                backgroundColor: const Color.fromRGBO(1, 98, 153, 1),
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              addFollowOnModal(context);
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
                backgroundColor: Colors.white,
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FollowOnListPage();
              }));
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

  Future<dynamic> addFollowOnModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return SizedBox(
              height: 800,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                        child: const Text('Add Follow On Job',
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
                            margin: const EdgeInsets.fromLTRB(0, 20, 15, 10),
                            child: const Icon(Icons.close)),
                      )
                    ],
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: const Text('Maintenance Advise')),
                            TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Type a description',
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Reason')),
                            FutureBuilder<List<DropdownMenuItem<String>>>(
                                future: FollowService.getReason(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return DropdownButtonFormField(
                                        hint: Text('Please select reason'),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor: const Color.fromRGBO(
                                                226, 234, 239, 1),
                                            contentPadding:
                                                const EdgeInsets.all(13)),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            newValue!;
                                          });
                                        },
                                        items: null);
                                  } else {
                                    return DropdownButtonFormField(
                                        hint: Text('Please select reason'),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor: const Color.fromRGBO(
                                                226, 234, 239, 1),
                                            contentPadding:
                                                const EdgeInsets.all(13)),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            newValue!;
                                          });
                                        },
                                        items: snapshot.data!);
                                  }
                                }),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Next Unit')),
                            FutureBuilder<List<DropdownMenuItem<String>>>(
                                future: FollowService.getUnit(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return DropdownButtonFormField(
                                        hint: Text('Please select unit'),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor: const Color.fromRGBO(
                                                226, 234, 239, 1),
                                            contentPadding:
                                                const EdgeInsets.all(13)),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            newValue!;
                                          });
                                        },
                                        items: null);
                                  } else {
                                    return DropdownButtonFormField(
                                        hint: Text('Please select unit'),
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      226, 234, 239, 1),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            filled: true,
                                            fillColor: const Color.fromRGBO(
                                                226, 234, 239, 1),
                                            contentPadding:
                                                const EdgeInsets.all(13)),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            newValue!;
                                          });
                                        },
                                        items: snapshot.data!);
                                  }
                                }),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Part Name')),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Please type part name',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(226, 234, 239, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(226, 234, 239, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(226, 234, 239, 1),
                                  contentPadding: const EdgeInsets.all(13)),
                              onChanged: (String? newValue) {
                                setState(() {
                                  newValue!;
                                });
                              },
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Part Number')),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Please type part number',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(226, 234, 239, 1),
                                    contentPadding: const EdgeInsets.all(13)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    newValue!;
                                  });
                                }),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('SN.In')),
                            TextField(
                                decoration: InputDecoration(
                                    hintText: 'Please type SN.in',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(226, 234, 239, 1),
                                    contentPadding: const EdgeInsets.all(13)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    newValue!;
                                  });
                                }),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('SN.Out')),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Please type SN.out',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(226, 234, 239, 1),
                                    contentPadding: const EdgeInsets.all(13)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    newValue!;
                                  });
                                }),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Follow On Status')),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Please type follow on status',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(226, 234, 239, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(226, 234, 239, 1),
                                    contentPadding: const EdgeInsets.all(13)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    newValue!;
                                  });
                                })
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 15, 50),
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
                  ))
                ],
              ),
            );
          });
        });
  }
}
