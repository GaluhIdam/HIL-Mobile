import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/taskdetailModel.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Services/optionService.dart';
import 'package:hil_mobile/Services/statusService.dart';
import 'package:hil_mobile/Services/taskService.dart';
import '../Widgets/detailTask.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);
  static const routeName = "/task_details_pages";
  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPage();
}

class _TaskDetailsPage extends State<TaskDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  String? token;

  @override
  void initState() {
    super.initState();
    AuthService.hasToken().then((value) {
      setState(() {
        token = value['token'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final passData = ModalRoute.of(context)?.settings.arguments as Map;
    dynamic itemid = passData['itemId'];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
              child: FutureBuilder<List<TaskDetailData>>(
                future: TaskService.getTaskDetail(itemid, token),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    List<TaskDetailData> detailTask = snapshot.data!;
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text('Data not available!'),
                      );
                    } else {
                      return DetailTask(
                        optionId: detailTask[0].optionId,
                        token: token,
                        reason: detailTask[0].reason,
                        itemId: detailTask[0].itemId == null
                            ? '-'
                            : detailTask[0].itemId.toString(),
                        subject: detailTask[0].subject == null
                            ? '-'
                            : detailTask[0].subject.toString(),
                        flightNumber: detailTask[0].flightNo == null
                            ? '-'
                            : detailTask[0].flightNo.toString(),
                        aircraftType: detailTask[0].acType == null
                            ? '-'
                            : detailTask[0].acType.toString(),
                        aircraftRegistration: detailTask[0].acreg == null
                            ? '-'
                            : detailTask[0].acreg.toString(),
                        station: detailTask[0].sta == null
                            ? '-'
                            : detailTask[0].sta.toString(),
                        ata: detailTask[0].ataNo == null
                            ? '-'
                            : detailTask[0].ataNo.toString(),
                        sequenceNumber: detailTask[0].seqNo == null
                            ? '-'
                            : detailTask[0].seqNo.toString(),
                        dateOccured: detailTask[0].dateOccur ?? '-',
                        dueDate: detailTask[0].dueDate ?? '-',
                        stationCode: detailTask[0].staCode == null
                            ? '-'
                            : detailTask[0].staCode.toString(),
                        faultCode: detailTask[0].subAta == null
                            ? '-'
                            : detailTask[0].subAta.toString(),
                        categoryName: detailTask[0].categoryDesc == null
                            ? '-'
                            : detailTask[0].categoryDesc.toString(),
                        techlog: detailTask[0].techlog == null
                            ? '-'
                            : detailTask[0].techlog.toString(),
                        ref: 'AML',
                        refDdg: detailTask[0].ddgRef == null
                            ? '-'
                            : detailTask[0].ddgRef.toString(),
                        optionStatus: detailTask[0].longName == null
                            ? '-'
                            : detailTask[0].longName.toString(),
                        description: detailTask[0].description == null
                            ? '-'
                            : detailTask[0].description.toString(),
                        partNumber: detailTask[0].partNbr == null
                            ? '-'
                            : detailTask[0].partNbr.toString(),
                        partName: detailTask[0].partName == null
                            ? '-'
                            : detailTask[0].partName.toString(),
                        statusName: '-',
                        optionName: detailTask[0].longName == null
                            ? '-'
                            : detailTask[0].longName.toString(),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text('Connection failed!'),
                    );
                  }
                },
              ))),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(219, 219, 219, 1), width: 1))),
        height: 60,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FutureBuilder<List<TaskDetailData>>(
                future: TaskService.getTaskDetail(itemid, token),
                builder: (context, snapshot) {
                  if (snapshot.data == null ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          width: MediaQuery.of(context).size.width / 3.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  backgroundColor:
                                      const Color.fromRGBO(239, 173, 66, 1),
                                  side: const BorderSide(
                                      color: Color.fromRGBO(239, 173, 66, 1)),
                                  minimumSize: const Size.fromHeight(5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Text('Change Status')),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          width: MediaQuery.of(context).size.width / 3.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(239, 173, 66, 1)),
                                  minimumSize: const Size.fromHeight(5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Text(
                                'Change Option',
                                style: TextStyle(
                                    color: Color.fromRGBO(239, 173, 66, 1)),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          width: MediaQuery.of(context).size.width / 3.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  backgroundColor:
                                      const Color.fromRGBO(219, 219, 219, 1),
                                  side: const BorderSide(
                                      color: Color.fromRGBO(219, 219, 219, 1)),
                                  minimumSize: const Size.fromHeight(5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Text(
                                'Download',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    );
                  } else {
                    List<TaskDetailData> detailTask = snapshot.data!;
                    return Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          width: MediaQuery.of(context).size.width / 3.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  side: const BorderSide(
                                      color: Color.fromRGBO(239, 173, 66, 1)),
                                  backgroundColor:
                                      const Color.fromRGBO(239, 173, 66, 1),
                                  minimumSize: const Size.fromHeight(5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                          height: 550,
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              child: Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  15,
                                                                  15,
                                                                  0,
                                                                  10),
                                                          child: const Text(
                                                              'Change HIL Status',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        1,
                                                                        98,
                                                                        153,
                                                                        1),
                                                              )),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  0,
                                                                  15,
                                                                  15,
                                                                  10),
                                                              child: const Icon(
                                                                  Icons.close)),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              15),
                                                      width: double.infinity,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 0, 0, 10),
                                                              child: const Text(
                                                                  'Change Description')),
                                                          TextFormField(
                                                            enabled: false,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please enter description';
                                                              }
                                                              return null;
                                                            },
                                                            initialValue:
                                                                detailTask[0]
                                                                    .description,
                                                            onChanged: (dynamic
                                                                valueDesc) {
                                                              detailTask[0]
                                                                      .description =
                                                                  valueDesc!;
                                                            },
                                                            keyboardType:
                                                                TextInputType
                                                                    .multiline,
                                                            maxLines: 5,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor: Color
                                                                  .fromRGBO(
                                                                      226,
                                                                      234,
                                                                      239,
                                                                      1),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              hintText:
                                                                  'Type a description',
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(15),
                                                            ),
                                                          ),
                                                          Container(
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 30, 0, 10),
                                                              child: const Text(
                                                                  'Change Status to')),
                                                          FutureBuilder<
                                                                  List<
                                                                      DropdownMenuItem<
                                                                          String>>>(
                                                              future:
                                                                  StatusService
                                                                      .getStatus(
                                                                          token),
                                                              builder: (context,
                                                                  snaphot) {
                                                                if (snaphot
                                                                        .data ==
                                                                    null) {
                                                                  return DropdownButtonFormField(
                                                                      hint: Text(
                                                                          'Please select status'),
                                                                      decoration: InputDecoration(
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          border: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          filled: true,
                                                                          fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                          contentPadding: const EdgeInsets.all(13)),
                                                                      onChanged: (dynamic newValue) {
                                                                        setState(
                                                                            () {
                                                                          newValue!;
                                                                        });
                                                                      },
                                                                      items: null);
                                                                } else {
                                                                  if (detailTask[0]
                                                                              .statusNo ==
                                                                          '' ||
                                                                      detailTask[0]
                                                                              .statusNo ==
                                                                          null) {
                                                                    return DropdownButtonFormField(
                                                                        hint: Text(
                                                                            'Please select status'),
                                                                        decoration: InputDecoration(
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            border: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                            contentPadding: const EdgeInsets.all(13)),
                                                                        onChanged: (dynamic newValue) {
                                                                          setState(
                                                                              () {
                                                                            newValue!;
                                                                          });
                                                                        },
                                                                        items: snaphot.data!);
                                                                  } else {
                                                                    return DropdownButtonFormField(
                                                                        hint: Text(
                                                                            'Please select status'),
                                                                        decoration: InputDecoration(
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            border: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                            contentPadding: const EdgeInsets.all(13)),
                                                                        value: detailTask[0].statusNo,
                                                                        onChanged: (dynamic newValue) {
                                                                          setState(
                                                                              () {
                                                                            detailTask[0].statusNo =
                                                                                newValue!;
                                                                          });
                                                                        },
                                                                        items: snaphot.data!);
                                                                  }
                                                                }
                                                              }),
                                                          Container(
                                                              margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 30, 0, 10),
                                                              child: const Text(
                                                                  'Station Close')),
                                                          FutureBuilder<
                                                                  List<
                                                                      DropdownMenuItem<
                                                                          String>>>(
                                                              future: StatusService
                                                                  .getStation(
                                                                      token),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                        .data ==
                                                                    null) {
                                                                  return DropdownButtonFormField(
                                                                      hint: Text(
                                                                          'Please select station'),
                                                                      decoration: InputDecoration(
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          border: OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          filled: true,
                                                                          fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                          contentPadding: const EdgeInsets.all(13)),
                                                                      onChanged: (dynamic newValue) {
                                                                        setState(
                                                                            () {
                                                                          newValue!;
                                                                        });
                                                                      },
                                                                      items: null);
                                                                } else {
                                                                  if (detailTask[0]
                                                                              .staClose ==
                                                                          'null' ||
                                                                      detailTask[0]
                                                                              .staClose ==
                                                                          null) {
                                                                    return DropdownButtonFormField(
                                                                        hint: Text(
                                                                            'Please select station'),
                                                                        decoration: InputDecoration(
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            border: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                            contentPadding: const EdgeInsets.all(13)),
                                                                        value: detailTask[0].staClose,
                                                                        onChanged: (dynamic newValue) {
                                                                          setState(
                                                                              () {
                                                                            detailTask[0].staClose =
                                                                                newValue;
                                                                          });
                                                                        },
                                                                        items: snapshot.data!);
                                                                  } else {
                                                                    return DropdownButtonFormField(
                                                                        hint: Text(
                                                                            'Please select station'),
                                                                        decoration: InputDecoration(
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            border: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                            contentPadding: const EdgeInsets.all(13)),
                                                                        value: detailTask[0].staClose,
                                                                        onChanged: (dynamic newValue) {
                                                                          setState(
                                                                              () {
                                                                            detailTask[0].staClose =
                                                                                newValue!;
                                                                          });
                                                                        },
                                                                        items: snapshot.data);
                                                                  }
                                                                }
                                                              })
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                const Color
                                                                        .fromRGBO(
                                                                    1,
                                                                    98,
                                                                    153,
                                                                    1),
                                                            minimumSize: const Size
                                                                .fromHeight(45),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10))),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  content: Text(
                                                                      'Updating data...')),
                                                            );
                                                            StatusService.updateStatus(
                                                                    detailTask[
                                                                            0]
                                                                        .itemId,
                                                                    token,
                                                                    detailTask[
                                                                            0]
                                                                        .statusNo,
                                                                    detailTask[
                                                                            0]
                                                                        .staClose,
                                                                    detailTask[
                                                                            0]
                                                                        .description)
                                                                .then((value) {
                                                              Navigator.pop(
                                                                  context);
                                                              if (value['status'] ==
                                                                      'Error' ||
                                                                  value['status'] ==
                                                                      'Failed') {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                      behavior:
                                                                          SnackBarBehavior
                                                                              .floating,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      content:
                                                                          Text(
                                                                        value[
                                                                            'message'],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                      behavior:
                                                                          SnackBarBehavior
                                                                              .floating,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green,
                                                                      content:
                                                                          Text(
                                                                        value[
                                                                            'message'],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      )),
                                                                );
                                                              }

                                                              Navigator.pushReplacementNamed(
                                                                  context,
                                                                  TaskDetailsPage
                                                                      .routeName,
                                                                  arguments: {
                                                                    "itemId":
                                                                        detailTask[0]
                                                                            .itemId,
                                                                    "token":
                                                                        token,
                                                                  });
                                                            });
                                                          }
                                                        },
                                                        child: const Text(
                                                          'Save',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )));
                                    });
                              },
                              child: const Text(
                                'Change Status',
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          width: MediaQuery.of(context).size.width / 3.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  side: const BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(239, 173, 66, 1)),
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(5),
                                  // maximumSize: const Size.fromWidth(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return FutureBuilder<
                                              List<DropdownMenuItem<String>>>(
                                          future:
                                              OptionService.getOption(token),
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null ||
                                                snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                              return StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      setState) {
                                                return SizedBox(
                                                    height: 270,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 10, 0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                    15,
                                                                    15,
                                                                    0,
                                                                    10),
                                                                child: const Text(
                                                                    'Change HIL Option',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              1,
                                                                              98,
                                                                              153,
                                                                              1),
                                                                    )),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Container(
                                                                    margin:
                                                                        const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            15,
                                                                            15,
                                                                            10),
                                                                    child: const Icon(
                                                                        Icons
                                                                            .close)),
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(15),
                                                              width: double
                                                                  .infinity,
                                                              child: Form(
                                                                key: _formKey,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                        margin: const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                        child: const Text(
                                                                            'Change Option to')),
                                                                    DropdownButtonFormField(
                                                                        validator:
                                                                            (value) {
                                                                          if (value ==
                                                                              null) {
                                                                            return 'Please select option';
                                                                          }
                                                                          return null;
                                                                        },
                                                                        hint: Text(
                                                                            'Please select option'),
                                                                        decoration: InputDecoration(
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            border: OutlineInputBorder(
                                                                              borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            ),
                                                                            filled: true,
                                                                            fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                            contentPadding: const EdgeInsets.all(13)),
                                                                        onChanged: (dynamic newValue) {
                                                                          setState(
                                                                              () {
                                                                            newValue!;
                                                                          });
                                                                        },
                                                                        items: null)
                                                                  ],
                                                                ),
                                                              )),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      const Color.fromRGBO(
                                                                          1,
                                                                          98,
                                                                          153,
                                                                          1),
                                                                  minimumSize:
                                                                      const Size
                                                                              .fromHeight(
                                                                          45),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10))),
                                                              onPressed: () {
                                                                if (_formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    const SnackBar(
                                                                        duration: Duration(
                                                                            seconds:
                                                                                1),
                                                                        behavior:
                                                                            SnackBarBehavior
                                                                                .floating,
                                                                        content:
                                                                            Text('Updating data...')),
                                                                  );
                                                                  OptionService.updateOption(
                                                                      detailTask[
                                                                              0]
                                                                          .itemId,
                                                                      token,
                                                                      detailTask[
                                                                              0]
                                                                          .optionId);
                                                                }
                                                              },
                                                              child: const Text(
                                                                'Save',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              });
                                            } else {
                                              return SizedBox(
                                                  height: 270,
                                                  child: detailTask[0]
                                                                  .optionId ==
                                                              null ||
                                                          detailTask[0]
                                                                  .optionId ==
                                                              'null'
                                                      ? Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  10, 0, 10, 0),
                                                          child: Form(
                                                            key: _formKey,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                          15,
                                                                          15,
                                                                          0,
                                                                          10),
                                                                      child: const Text(
                                                                          'Change HIL Option',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color: Color.fromRGBO(
                                                                                1,
                                                                                98,
                                                                                153,
                                                                                1),
                                                                          )),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          margin: const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              15,
                                                                              15,
                                                                              10),
                                                                          child:
                                                                              const Icon(Icons.close)),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  width: double
                                                                      .infinity,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                          margin: const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              10),
                                                                          child:
                                                                              const Text('Change Option to')),
                                                                      DropdownButtonFormField(
                                                                          validator:
                                                                              (value) {
                                                                            if (value ==
                                                                                null) {
                                                                              return 'Please select option';
                                                                            }
                                                                            return null;
                                                                          },
                                                                          hint:
                                                                              Text('Please select option'),
                                                                          decoration: InputDecoration(
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              border: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              filled: true,
                                                                              fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                              contentPadding: const EdgeInsets.all(13)),
                                                                          onChanged: (dynamic newValue) {
                                                                            setState(() {
                                                                              detailTask[0].optionId = newValue!;
                                                                            });
                                                                          },
                                                                          items: snapshot.data!)
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: const Color.fromRGBO(
                                                                            1,
                                                                            98,
                                                                            153,
                                                                            1),
                                                                        minimumSize:
                                                                            const Size.fromHeight(
                                                                                45),
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10))),
                                                                    onPressed:
                                                                        () {
                                                                      if (_formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          const SnackBar(
                                                                              duration: Duration(seconds: 1),
                                                                              behavior: SnackBarBehavior.floating,
                                                                              content: Text('Updating data...')),
                                                                        );
                                                                        OptionService.updateOption(
                                                                                detailTask[0].itemId,
                                                                                token,
                                                                                detailTask[0].optionId)
                                                                            .then((value) {
                                                                          Navigator.pop(
                                                                              context);
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                                behavior: SnackBarBehavior.floating,
                                                                                backgroundColor: Colors.green,
                                                                                content: Text(
                                                                                  value['message'],
                                                                                  style: TextStyle(color: Colors.white),
                                                                                )),
                                                                          );

                                                                          Navigator.pushReplacementNamed(
                                                                              context,
                                                                              TaskDetailsPage.routeName,
                                                                              arguments: {
                                                                                "itemId": detailTask[0].itemId,
                                                                                "token": token,
                                                                              });
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ))
                                                      : Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  10, 0, 10, 0),
                                                          child: Form(
                                                            key: _formKey,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                          15,
                                                                          15,
                                                                          0,
                                                                          10),
                                                                      child: const Text(
                                                                          'Change HIL Option',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            color: Color.fromRGBO(
                                                                                1,
                                                                                98,
                                                                                153,
                                                                                1),
                                                                          )),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Container(
                                                                          margin: const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              15,
                                                                              15,
                                                                              10),
                                                                          child:
                                                                              const Icon(Icons.close)),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  width: double
                                                                      .infinity,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                          margin: const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              10),
                                                                          child:
                                                                              const Text('Change Option to')),
                                                                      detailTask[0].optionId == '' ||
                                                                              detailTask[0].optionId == 'null'
                                                                          ? DropdownButtonFormField(
                                                                              validator: (value) {
                                                                                if (value == null) {
                                                                                  return 'Please select option';
                                                                                }
                                                                                return null;
                                                                              },
                                                                              hint: Text('Please select option'),
                                                                              decoration: InputDecoration(
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                  border: OutlineInputBorder(
                                                                                    borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                                  contentPadding: const EdgeInsets.all(13)),
                                                                              onChanged: (dynamic newValue) {
                                                                                setState(() {
                                                                                  newValue!;
                                                                                });
                                                                              },
                                                                              items: snapshot.data)
                                                                          : DropdownButtonFormField(
                                                                              validator: (value) {
                                                                                if (value == null) {
                                                                                  return 'Please select option';
                                                                                }
                                                                                return null;
                                                                              },
                                                                              hint: Text('Please select option'),
                                                                              decoration: InputDecoration(
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                  border: OutlineInputBorder(
                                                                                    borderSide: const BorderSide(color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                  filled: true,
                                                                                  fillColor: const Color.fromRGBO(226, 234, 239, 1),
                                                                                  contentPadding: const EdgeInsets.all(13)),
                                                                              value: detailTask[0].optionId,
                                                                              onChanged: (dynamic newValue) {
                                                                                setState(() {
                                                                                  detailTask[0].optionId = newValue!;
                                                                                });
                                                                              },
                                                                              items: snapshot.data!),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: const Color.fromRGBO(
                                                                            1,
                                                                            98,
                                                                            153,
                                                                            1),
                                                                        minimumSize:
                                                                            const Size.fromHeight(
                                                                                45),
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10))),
                                                                    onPressed:
                                                                        () {
                                                                      if (_formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          const SnackBar(
                                                                              duration: Duration(seconds: 1),
                                                                              behavior: SnackBarBehavior.floating,
                                                                              content: Text('Updating data...')),
                                                                        );
                                                                        OptionService.updateOption(
                                                                                detailTask[0].itemId,
                                                                                token,
                                                                                detailTask[0].optionId)
                                                                            .then((value) {
                                                                          Navigator.pop(
                                                                              context);
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                                behavior: SnackBarBehavior.floating,
                                                                                backgroundColor: Colors.green,
                                                                                content: Text(
                                                                                  value['message'],
                                                                                  style: TextStyle(color: Colors.white),
                                                                                )),
                                                                          );

                                                                          Navigator.pushReplacementNamed(
                                                                              context,
                                                                              TaskDetailsPage.routeName,
                                                                              arguments: {
                                                                                "itemId": detailTask[0].itemId,
                                                                                "token": token,
                                                                              });
                                                                        });
                                                                      }
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )));
                                            }
                                          });
                                    });
                              },
                              child: const Text(
                                'Change Option',
                                style: TextStyle(
                                    color: Color.fromRGBO(239, 173, 66, 1)),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          width: MediaQuery.of(context).size.width / 3.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  side: const BorderSide(
                                      color: Color.fromRGBO(219, 219, 219, 1)),
                                  backgroundColor:
                                      const Color.fromRGBO(219, 219, 219, 1),
                                  minimumSize: const Size.fromHeight(5),
                                  // maximumSize: const Size.fromWidth(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Text(
                                'Download',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
