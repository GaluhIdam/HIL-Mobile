import 'package:flutter/material.dart';
import 'package:hil_mobile/Pages/follow_on_list_page.dart';
import 'package:hil_mobile/Pages/task_details_page.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Services/followService.dart';
import 'package:hil_mobile/Services/optionService.dart';
import 'package:intl/intl.dart';

class DetailTask extends StatefulWidget {
  dynamic itemId,
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
      optionName,
      reason,
      token,
      optionId;

  DetailTask({
    super.key,
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
    required this.reason,
    required this.token,
    required this.optionId,
  });

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _maintenance = TextEditingController();

  final TextEditingController _partName = TextEditingController();

  final TextEditingController _partNumber = TextEditingController();

  final TextEditingController _snIn = TextEditingController();

  final TextEditingController _snOut = TextEditingController();

  List<DropdownMenuItem<String>> listReason = [];
  List<DropdownMenuItem<String>> listUnit = [];
  List<DropdownMenuItem<String>> listOption = [];

  String? token;
  String? nextUnit;

  @override
  void initState() {
    super.initState();
    AuthService.hasToken().then((value) {
      token = value['token'];
      FollowService.getReason(token).then((element) {
        element.forEach((element) {
          listReason.add(
            DropdownMenuItem(
                value: element['reasonNo'], child: Text(element['reasonDesc'])),
          );
        });
      });
      FollowService.getUnit(token).then((element) {
        element.forEach((element) {
          listUnit.add(
            DropdownMenuItem(
                value: element['id'], child: Text(element['unit'])),
          );
        });
      });
      OptionService.getOptions(token).then((element) {
        element.forEach((element) {
          listOption.add(
            DropdownMenuItem(
                value: element['optionID'], child: Text(element['long_name'])),
          );
        });
      });
    });
  }

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
                      widget.itemId,
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
                            widget.optionName == 'Urgent'
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
                                : widget.optionName == 'Important'
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
                                    : widget.optionName == 'Urgent & Important'
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
                                        : widget.optionName == 'Important'
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
                                            : widget.optionName == 'Normal'
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
                                                : widget.optionName == '-'
                                                    ? Container(
                                                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                        decoration: BoxDecoration(
                                                            color: Color.fromARGB(255, 255, 0, 0),
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
                              widget.statusName,
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromRGBO(181, 12, 12, 1)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'on ${DateFormat('d MMM y').format(DateTime.parse(widget.dueDate))}',
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
                widget.subject,
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
                widget.flightNumber,
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
                        widget.aircraftType,
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
                        widget.dateOccured,
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
                        widget.aircraftRegistration,
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
                        widget.dueDate,
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
                        widget.station,
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
                      Text('Station Close'),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        widget.station,
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
                        widget.ata,
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
                        widget.faultCode,
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
                        widget.sequenceNumber,
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
                        widget.categoryName,
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
                        widget.techlog,
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
                        widget.optionStatus,
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
                widget.ref,
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
                widget.refDdg,
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
                widget.description,
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
                        widget.partNumber,
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
                        widget.partName,
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
            children: <Widget>[
              Text('Reason'),
              SizedBox(
                height: 7,
              ),
              Text(
                widget.reason.toString() == 'null' ? '-' : widget.reason,
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
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Scaffold(
                      resizeToAvoidBottomInset: true,
                      body: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 20, 0, 10),
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
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 20, 20, 10),
                                    child: const Icon(Icons.close)),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 0, 10, 0),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 10),
                                              child: const Text(
                                                  'Maintenance Advise')),
                                          TextFormField(
                                            controller: _maintenance,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter maintenance advise';
                                              }
                                              return null;
                                            },
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 5,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: 'Type a description',
                                              contentPadding:
                                                  const EdgeInsets.all(15),
                                            ),
                                          ),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: const Text('Reason')),
                                          DropdownButtonFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value == 'null') {
                                                  return 'Please select reason';
                                                }
                                                return null;
                                              },
                                              hint:
                                                  Text('Please select reason'),
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromRGBO(
                                                          226, 234, 239, 1),
                                                  contentPadding:
                                                      const EdgeInsets.all(13)),
                                              value: widget.reason,
                                              onChanged: (dynamic newValue) {
                                                setState(() {
                                                  widget.reason = newValue!;
                                                });
                                              },
                                              items: listReason),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: const Text('Next Unit')),
                                          DropdownButtonFormField(
                                              value: nextUnit,
                                              validator: (value) {
                                                if (value == null ||
                                                    value == 'null') {
                                                  return 'Please select next unit';
                                                }
                                                return null;
                                              },
                                              hint: Text('Please select unit'),
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromRGBO(
                                                          226, 234, 239, 1),
                                                  contentPadding:
                                                      const EdgeInsets.all(13)),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  nextUnit = newValue!;
                                                });
                                              },
                                              items: listUnit),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: const Text('Part Name')),
                                          TextFormField(
                                            controller: _partName,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter part name';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                hintText:
                                                    'Please type part name',
                                                enabledBorder:
                                                    OutlineInputBorder(
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
                                          ),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: const Text('Part Number')),
                                          TextFormField(
                                              controller: _partNumber,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter part number';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Please type part number',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromRGBO(
                                                          226, 234, 239, 1),
                                                  contentPadding:
                                                      const EdgeInsets.all(13)),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  newValue!;
                                                });
                                              }),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: const Text('SN.In')),
                                          TextFormField(
                                              controller: _snIn,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter SN.In';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Please type SN.in',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromRGBO(
                                                          226, 234, 239, 1),
                                                  contentPadding:
                                                      const EdgeInsets.all(13)),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  newValue!;
                                                });
                                              }),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: const Text('SN.Out')),
                                          TextFormField(
                                              controller: _snOut,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter SN.Out';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Please type SN.out',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromRGBO(
                                                          226, 234, 239, 1),
                                                  contentPadding:
                                                      const EdgeInsets.all(13)),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  newValue!;
                                                });
                                              }),
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: const Text(
                                                  'Change Option to')),
                                          DropdownButtonFormField(
                                              value: widget.optionId.toString(),
                                              validator: (value) {
                                                if (value == null ||
                                                    value == 'null') {
                                                  return 'Please select option';
                                                }
                                                return null;
                                              },
                                              hint:
                                                  Text('Please select option'),
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    226,
                                                                    234,
                                                                    239,
                                                                    1),
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color.fromRGBO(
                                                          226, 234, 239, 1),
                                                  contentPadding:
                                                      const EdgeInsets.all(13)),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  widget.optionId = newValue!;
                                                });
                                              },
                                              items: listOption),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 20, 15, 20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    1, 98, 153, 1),
                                            minimumSize:
                                                const Size.fromHeight(45),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content: Text(
                                                      'Add follow on job...')),
                                            );
                                            FollowService.updateFollow(
                                                    widget.itemId,
                                                    widget.token,
                                                    _maintenance.text,
                                                    nextUnit,
                                                    _partNumber.text,
                                                    _partName.text,
                                                    _snIn.text,
                                                    _snOut.text,
                                                    widget.reason)
                                                .then((value) {
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Colors.green,
                                                    content: Text(
                                                      value['message'],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              );
                                              Navigator.pushReplacementNamed(
                                                  context,
                                                  TaskDetailsPage.routeName,
                                                  arguments: {
                                                    "itemId": widget.itemId,
                                                    "token": widget.token,
                                                  });
                                            });
                                          }
                                        },
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    );
                  });
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
              FollowService.getFollowList(widget.itemId, widget.token)
                  .then((value) {
                Navigator.pushNamed(context, FollowOnListPage.routeName,
                    arguments: widget.itemId);
              });
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
