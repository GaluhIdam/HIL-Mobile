import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/taskdetailModel.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/Services/optionService.dart';
import 'package:hil_mobile/Services/statusService.dart';
import 'package:hil_mobile/Services/taskService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
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

  List<DropdownMenuItem<String>> dataOption = [];
  List<DropdownMenuItem<String>> dataStatus = [];
  List<DropdownMenuItem<String>> dataStation = [];
  List detailTask = [];
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    AuthService.hasToken().then((value) {
      final passData = ModalRoute.of(context)?.settings.arguments as Map;
      setState(() {
        token = value['token'];
      });
      TaskService.getTaskDetail(passData['itemId'], token).then((value) {
        setState(() {
          detailTask = value;
        });
      });
      OptionService.getOption(token).then((value) {
        dataOption.addAll(value);
      });
      StatusService.getStatus(token).then((value) {
        dataStatus.addAll(value);
      });
      StatusService.getStation(token).then((value) {
        dataStation.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final passData = ModalRoute.of(context)?.settings.arguments as Map;
    dynamic dueStatus = passData['dueStatus'];
    dynamic priority = passData['priority'];
    dynamic statusName = passData['statusName'];

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                child: ListView.builder(
                    itemCount: detailTask.length,
                    itemBuilder: (context, index) {
                      if (detailTask.isNotEmpty) {
                        return DetailTask(
                          optionId: detailTask[index].optionId.toString(),
                          token: token.toString(),
                          reason: detailTask[index].reason.toString(),
                          itemId: detailTask[index].itemId == null
                              ? '-'
                              : detailTask[index].itemId.toString(),
                          subject: detailTask[index].subject == null
                              ? '-'
                              : detailTask[index].subject.toString(),
                          flightNumber: detailTask[index].flightNo == null
                              ? '-'
                              : detailTask[index].flightNo.toString(),
                          aircraftType: detailTask[index].acType == null
                              ? '-'
                              : detailTask[index].acType.toString(),
                          aircraftRegistration: detailTask[index].acreg == null
                              ? '-'
                              : detailTask[index].acreg.toString(),
                          station: detailTask[index].sta == null
                              ? '-'
                              : detailTask[index].sta.toString(),
                          ata: detailTask[index].ataNo == null
                              ? '-'
                              : detailTask[index].ataNo.toString(),
                          sequenceNumber: detailTask[index].seqNo == null
                              ? '-'
                              : detailTask[index].seqNo.toString(),
                          dateOccured: detailTask[index].dateOccur ?? '-',
                          dueDate: detailTask[index].dueDate ?? '-',
                          stationCode: detailTask[index].staCode == null
                              ? '-'
                              : detailTask[index].staCode.toString(),
                          faultCode: detailTask[index].subAta == null
                              ? '-'
                              : detailTask[index].subAta.toString(),
                          categoryName: detailTask[index].categoryDesc == null
                              ? '-'
                              : detailTask[index].categoryDesc.toString(),
                          techlog: detailTask[index].techlog == null
                              ? '-'
                              : detailTask[index].techlog.toString(),
                          ref: 'AML',
                          refDdg: detailTask[index].ddgRef == null
                              ? '-'
                              : detailTask[index].ddgRef.toString(),
                          optionStatus: detailTask[index].longName == null
                              ? '-'
                              : detailTask[index].longName.toString(),
                          description: detailTask[index].description == null
                              ? '-'
                              : detailTask[index].description.toString(),
                          partNumber: detailTask[index].partNbr == null
                              ? '-'
                              : detailTask[index].partNbr.toString(),
                          partName: detailTask[index].partName == null
                              ? '-'
                              : detailTask[index].partName.toString(),
                          statusName: dueStatus == "-"
                              ? priority
                              : dueStatus == null
                                  ? statusName
                                  : priority,
                          dueStatus:
                              dueStatus == "" ? '-' : dueStatus.toString(),
                          priority: priority.toString(),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 350),
                          child: Center(
                            child: Text('Data not available'),
                          ),
                        );
                      }
                    }),
              )),
        ),
        bottomNavigationBar: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
          child: Container(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Color.fromRGBO(219, 219, 219, 1), width: 1))),
            height: 60,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                  width: MediaQuery.of(context).size.width / 3.7,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(textScaleFactor: 0.8),
                                child: SizedBox(
                                    height: 520,
                                    child: Container(
                                        padding: const EdgeInsets.fromLTRB(
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
                                                        15, 15, 0, 10),
                                                    child: const Text(
                                                        'Change HIL Status',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromRGBO(
                                                              1, 98, 153, 1),
                                                        )),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            0, 15, 15, 10),
                                                        child: const Icon(
                                                            Icons.close)),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(15),
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please enter description';
                                                        }
                                                        return null;
                                                      },
                                                      initialValue:
                                                          detailTask[0]
                                                              .description,
                                                      onChanged:
                                                          (dynamic valueDesc) {
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
                                                        fillColor:
                                                            Color.fromRGBO(226,
                                                                234, 239, 1),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                                    DropdownButtonFormField(
                                                        hint: Text(
                                                            'Please select status'),
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: Color.fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                      width: 2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: Color.fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                      width: 2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                filled: true,
                                                                fillColor:
                                                                    const Color
                                                                            .fromRGBO(
                                                                        226,
                                                                        234,
                                                                        239,
                                                                        1),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        13)),
                                                        value: detailTask[0]
                                                            .statusNo,
                                                        onChanged:
                                                            (dynamic newValue) {
                                                          setState(() {
                                                            detailTask[0]
                                                                    .statusNo =
                                                                newValue!;
                                                          });
                                                        },
                                                        items: dataStatus),
                                                    Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            0, 30, 0, 10),
                                                        child: const Text(
                                                            'Station Close')),
                                                    DropdownButtonFormField(
                                                        hint: Text(
                                                            'Please select station'),
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: Color.fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                      width: 2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: Color.fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                      width: 2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                filled: true,
                                                                fillColor:
                                                                    const Color
                                                                            .fromRGBO(
                                                                        226,
                                                                        234,
                                                                        239,
                                                                        1),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        13)),
                                                        value: detailTask[0]
                                                            .staClose,
                                                        onChanged:
                                                            (dynamic newValue) {
                                                          setState(() {
                                                            detailTask[0]
                                                                    .staClose =
                                                                newValue!;
                                                          });
                                                        },
                                                        items: dataStation),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 15, 0, 15),
                                                  child: RoundedLoadingButton(
                                                    borderRadius: 10,
                                                    height: 45,
                                                    width: 340,
                                                    color: Color.fromRGBO(
                                                        1, 98, 153, 1),
                                                    // ignore: sort_child_properties_last
                                                    child: Text('Save',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    controller: _btnController,
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        ScaffoldMessenger.of(
                                                                context)
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
                                                                detailTask[0]
                                                                    .itemId,
                                                                token,
                                                                detailTask[0]
                                                                    .statusNo,
                                                                detailTask[0]
                                                                    .staClose,
                                                                detailTask[0]
                                                                    .description)
                                                            .then((value) {
                                                          Navigator.pop(
                                                              context);
                                                          if (value['status'] ==
                                                                  'Error' ||
                                                              value['status'] ==
                                                                  'Failed') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  content: Text(
                                                                    value[
                                                                        'message'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  content: Text(
                                                                    value[
                                                                        'message'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                            );
                                                          }

                                                          Navigator
                                                              .pushReplacementNamed(
                                                                  context,
                                                                  TaskDetailsPage
                                                                      .routeName,
                                                                  arguments: {
                                                                "priority":
                                                                    priority,
                                                                "dueStatus":
                                                                    dueStatus,
                                                                "statusName":
                                                                    statusName,
                                                                "itemId":
                                                                    detailTask[
                                                                            0]
                                                                        .itemId,
                                                                "token": token,
                                                              });
                                                        });
                                                      }
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ))),
                              );
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
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          side: const BorderSide(
                              width: 2, color: Color.fromRGBO(239, 173, 66, 1)),
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(textScaleFactor: 0.8),
                                  child: SizedBox(
                                      height: 265,
                                      child: Container(
                                          padding: const EdgeInsets.fromLTRB(
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
                                                          15, 15, 0, 10),
                                                      child: const Text(
                                                          'Change HIL Option',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromRGBO(
                                                                    1,
                                                                    98,
                                                                    153,
                                                                    1),
                                                          )),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                          margin:
                                                              const EdgeInsets
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
                                                      const EdgeInsets.all(15),
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 0, 0, 10),
                                                          child: const Text(
                                                              'Change Option to')),
                                                      DropdownButtonFormField(
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return 'Please select option';
                                                            }
                                                            return null;
                                                          },
                                                          hint: Text(
                                                              'Please select option'),
                                                          decoration:
                                                              InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            226,
                                                                            234,
                                                                            239,
                                                                            1),
                                                                        width:
                                                                            2),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            226,
                                                                            234,
                                                                            239,
                                                                            1),
                                                                        width:
                                                                            2),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor:
                                                                      const Color.fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  contentPadding:
                                                                      const EdgeInsets.all(
                                                                          13)),
                                                          value: detailTask[0]
                                                              .optionId,
                                                          onChanged: (dynamic
                                                              newValue) {
                                                            setState(() {
                                                              detailTask[0]
                                                                      .optionId =
                                                                  newValue!;
                                                            });
                                                          },
                                                          items: dataOption),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 15, 0, 15),
                                                    child: RoundedLoadingButton(
                                                      borderRadius: 10,
                                                      height: 45,
                                                      width: 340,
                                                      color: Color.fromRGBO(
                                                          1, 98, 153, 1),
                                                      // ignore: sort_child_properties_last
                                                      child: Text('Save',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                      controller:
                                                          _btnController,
                                                      onPressed: () {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          ScaffoldMessenger.of(
                                                                  context)
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
                                                          OptionService.updateOption(
                                                                  detailTask[0]
                                                                      .itemId,
                                                                  token,
                                                                  detailTask[0]
                                                                      .optionId)
                                                              .then((value) {
                                                            Navigator.pop(
                                                                context);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  content: Text(
                                                                    value[
                                                                        'message'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                            );

                                                            Navigator.pushReplacementNamed(
                                                                context,
                                                                TaskDetailsPage
                                                                    .routeName,
                                                                arguments: {
                                                                  "priority":
                                                                      priority,
                                                                  "dueStatus":
                                                                      dueStatus,
                                                                  "statusName":
                                                                      statusName,
                                                                  "itemId":
                                                                      detailTask[
                                                                              0]
                                                                          .itemId,
                                                                  "token":
                                                                      token,
                                                                });
                                                          });
                                                        }
                                                      },
                                                    )),
                                              ],
                                            ),
                                          ))));
                            });
                      },
                      child: const Text(
                        'Change Option',
                        style:
                            TextStyle(color: Color.fromRGBO(239, 173, 66, 1)),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                  width: MediaQuery.of(context).size.width / 3.7,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
            ),
          ),
        ));
  }
}
