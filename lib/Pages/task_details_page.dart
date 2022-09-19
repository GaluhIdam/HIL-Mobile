import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/taskdetailModel.dart';
import 'package:hil_mobile/Services/optionService.dart';
import 'package:hil_mobile/Services/statusService.dart';
import 'package:hil_mobile/Services/taskService.dart';
import 'package:hil_mobile/Widgets/optionChange.dart';
import 'package:intl/intl.dart';
import '../Widgets/detailTask.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);
  static const routeName = "/task_details_pages";
  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPage();
}

class _TaskDetailsPage extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final itemid = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: FutureBuilder<List<TaskDetailData>>(
                future: TaskService.getTaskDetail(itemid),
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
                        itemId: detailTask[0].itemId.toString(),
                        subject: detailTask[0].subject.toString(),
                        flightNumber: detailTask[0].flightNumber.toString(),
                        aircraftType: detailTask[0].aCType.toString(),
                        aircraftRegistration:
                            detailTask[0].aCRegistration.toString(),
                        station: detailTask[0].station.toString(),
                        ata: detailTask[0].ata.toString(),
                        sequenceNumber: detailTask[0].seqNumber.toString(),
                        dateOccured: DateFormat('yyyy-MM-dd, hh:mm a')
                            .format(detailTask[0].dateOccur)
                            .toString(),
                        dueDate: DateFormat('yyyy-MM-dd, hh:mm a')
                            .format(detailTask[0].dueDate)
                            .toString(),
                        stationCode: detailTask[0].stationCode.toString(),
                        faultCode: detailTask[0].faultCode.toString(),
                        categoryName: detailTask[0].category.toString(),
                        techlog: detailTask[0].techlog.toString(),
                        ref: detailTask[0].ref.toString(),
                        refDdg: detailTask[0].refDdg.toString(),
                        optionStatus: detailTask[0].optionStatus.toString(),
                        description: detailTask[0].description.toString(),
                        partNumber: detailTask[0].partNumber.toString(),
                        partName: detailTask[0].partName.toString(),
                        statusName: detailTask[0].itemId.toString(),
                        optionName: detailTask[0].itemId.toString(),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text('Connection Failed!'),
                    );
                  }
                },
              ))),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            // color: Colors.b,
            border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(219, 219, 219, 1), width: 1.0))),
        height: 60,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width / 3.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      side: const BorderSide(
                          color: Color.fromRGBO(239, 173, 66, 1)),
                      backgroundColor: const Color.fromRGBO(239, 173, 66, 1),
                      minimumSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                            return SizedBox(
                              height: 600,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 15, 0, 10),
                                        child: const Text('Change HIL Status',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Color.fromRGBO(1, 98, 153, 1),
                                            )),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 15, 15, 10),
                                            child: const Icon(Icons.close)),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(15),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: const Text(
                                                'Change Description')),
                                        TextField(
                                          keyboardType: TextInputType.multiline,
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
                                                0, 30, 0, 10),
                                            child:
                                                const Text('Change Status to')),
                                        FutureBuilder<
                                                List<DropdownMenuItem<String>>>(
                                            future: StatusService.getStatus(),
                                            builder: (context, snaphot) {
                                              if (snaphot.data == null) {
                                                return DropdownButtonFormField(
                                                    hint: Text(
                                                        'Please select status'),
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        filled: true,
                                                        fillColor: const Color
                                                                .fromRGBO(
                                                            226, 234, 239, 1),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(13)),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        newValue!;
                                                      });
                                                    },
                                                    items: null);
                                              } else {
                                                return DropdownButtonFormField(
                                                    hint: Text(
                                                        'Please select status'),
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        filled: true,
                                                        fillColor: const Color
                                                                .fromRGBO(
                                                            226, 234, 239, 1),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(13)),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        newValue!;
                                                      });
                                                    },
                                                    items: snaphot.data!);
                                              }
                                            }),
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 30, 0, 10),
                                            child: const Text('Station Close')),
                                        FutureBuilder<
                                                List<DropdownMenuItem<String>>>(
                                            future: StatusService.getStation(),
                                            builder: (context, snapshot) {
                                              if (snapshot.data == null) {
                                                return DropdownButtonFormField(
                                                    hint: Text(
                                                        'Please select station'),
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        filled: true,
                                                        fillColor: const Color
                                                                .fromRGBO(
                                                            226, 234, 239, 1),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(13)),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        newValue;
                                                      });
                                                    },
                                                    items: null);
                                              } else {
                                                return DropdownButtonFormField(
                                                    hint: Text(
                                                        'Please select station'),
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          226,
                                                                          234,
                                                                          239,
                                                                          1),
                                                                  width: 2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        filled: true,
                                                        fillColor: const Color
                                                                .fromRGBO(
                                                            226, 234, 239, 1),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(13)),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        newValue;
                                                      });
                                                    },
                                                    items: snapshot.data!);
                                              }
                                            })
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(15),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              1, 98, 153, 1),
                                          minimumSize:
                                              const Size.fromHeight(45),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        Navigator.pop(context);
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
                              ),
                            );
                          });
                        });
                  },
                  child: const Text('Change Status')),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width / 3.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      side: const BorderSide(
                          width: 2, color: Color.fromRGBO(239, 173, 66, 1)),
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return FutureBuilder<List<DropdownMenuItem<String>>>(
                              future: OptionService.getOption(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return OptionChange(dataOption: null);
                                } else {
                                  return OptionChange(
                                      dataOption: snapshot.data!);
                                }
                              });
                        });
                  },
                  child: const Text(
                    'Change Option',
                    style: TextStyle(color: Color.fromRGBO(239, 173, 66, 1)),
                  )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width / 3.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      side: const BorderSide(
                          color: Color.fromRGBO(219, 219, 219, 1)),
                      backgroundColor: const Color.fromRGBO(219, 219, 219, 1),
                      minimumSize: const Size.fromHeight(40),
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
    );
  }
}
