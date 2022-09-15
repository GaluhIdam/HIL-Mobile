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
  List<DropdownMenuItem<String>> get dropdownReason {
    List<DropdownMenuItem<String>> menuReason = [
      const DropdownMenuItem(value: "Open", child: Text("Open")),
      const DropdownMenuItem(value: "Option1", child: Text("Option 1")),
      const DropdownMenuItem(value: "Option2", child: Text("Option 2")),
      const DropdownMenuItem(value: "Option3", child: Text("Option 3")),
      const DropdownMenuItem(value: "Option4", child: Text("Option 4")),
      const DropdownMenuItem(value: "Option5", child: Text("Option 5")),
      const DropdownMenuItem(value: "Option6", child: Text("Option 6")),
      const DropdownMenuItem(value: "Option7", child: Text("Option 7")),
    ];
    return menuReason;
  }

  List<DropdownMenuItem<String>> get dropdownNextUnit {
    List<DropdownMenuItem<String>> menuNextUnit = [
      const DropdownMenuItem(value: "Open", child: Text("Open")),
      const DropdownMenuItem(value: "Option1", child: Text("Option 1")),
      const DropdownMenuItem(value: "Option2", child: Text("Option 2")),
      const DropdownMenuItem(value: "Option3", child: Text("Option 3")),
      const DropdownMenuItem(value: "Option4", child: Text("Option 4")),
      const DropdownMenuItem(value: "Option5", child: Text("Option 5")),
      const DropdownMenuItem(value: "Option6", child: Text("Option 6")),
      const DropdownMenuItem(value: "Option7", child: Text("Option 7")),
    ];
    return menuNextUnit;
  }

  List<DropdownMenuItem<String>> get dropdownPartName {
    List<DropdownMenuItem<String>> menuPartName = [
      const DropdownMenuItem(value: "Open", child: Text("Open")),
      const DropdownMenuItem(value: "Option1", child: Text("Option 1")),
      const DropdownMenuItem(value: "Option2", child: Text("Option 2")),
      const DropdownMenuItem(value: "Option3", child: Text("Option 3")),
      const DropdownMenuItem(value: "Option4", child: Text("Option 4")),
      const DropdownMenuItem(value: "Option5", child: Text("Option 5")),
      const DropdownMenuItem(value: "Option6", child: Text("Option 6")),
      const DropdownMenuItem(value: "Option7", child: Text("Option 7")),
    ];
    return menuPartName;
  }

  List<DropdownMenuItem<String>> get dropdownPartNumber {
    List<DropdownMenuItem<String>> menuPartNumber = [
      const DropdownMenuItem(value: "Open", child: Text("Open")),
      const DropdownMenuItem(value: "Option1", child: Text("Option 1")),
      const DropdownMenuItem(value: "Option2", child: Text("Option 2")),
      const DropdownMenuItem(value: "Option3", child: Text("Option 3")),
      const DropdownMenuItem(value: "Option4", child: Text("Option 4")),
      const DropdownMenuItem(value: "Option5", child: Text("Option 5")),
      const DropdownMenuItem(value: "Option6", child: Text("Option 6")),
      const DropdownMenuItem(value: "Option7", child: Text("Option 7")),
    ];
    return menuPartNumber;
  }

  List<DropdownMenuItem<String>> get dropdownSNIn {
    List<DropdownMenuItem<String>> menuSNIn = [
      const DropdownMenuItem(value: "Open", child: Text("Open")),
      const DropdownMenuItem(value: "Option1", child: Text("Option 1")),
      const DropdownMenuItem(value: "Option2", child: Text("Option 2")),
      const DropdownMenuItem(value: "Option3", child: Text("Option 3")),
      const DropdownMenuItem(value: "Option4", child: Text("Option 4")),
      const DropdownMenuItem(value: "Option5", child: Text("Option 5")),
      const DropdownMenuItem(value: "Option6", child: Text("Option 6")),
      const DropdownMenuItem(value: "Option7", child: Text("Option 7")),
    ];
    return menuSNIn;
  }

  List<DropdownMenuItem<String>> get dropdownSNOut {
    List<DropdownMenuItem<String>> menuSNOut = [
      const DropdownMenuItem(value: "Open", child: Text("Open")),
      const DropdownMenuItem(value: "Option1", child: Text("Option 1")),
      const DropdownMenuItem(value: "Option2", child: Text("Option 2")),
      const DropdownMenuItem(value: "Option3", child: Text("Option 3")),
      const DropdownMenuItem(value: "Option4", child: Text("Option 4")),
      const DropdownMenuItem(value: "Option5", child: Text("Option 5")),
      const DropdownMenuItem(value: "Option6", child: Text("Option 6")),
      const DropdownMenuItem(value: "Option7", child: Text("Option 7")),
    ];
    return menuSNOut;
  }

  List<DropdownMenuItem<String>> get dropdownFollowOnStatus {
    List<DropdownMenuItem<String>> menuFollowOnStatus = [
      const DropdownMenuItem(value: "Open", child: Text("Open")),
      const DropdownMenuItem(value: "Option1", child: Text("Option 1")),
      const DropdownMenuItem(value: "Option2", child: Text("Option 2")),
      const DropdownMenuItem(value: "Option3", child: Text("Option 3")),
      const DropdownMenuItem(value: "Option4", child: Text("Option 4")),
      const DropdownMenuItem(value: "Option5", child: Text("Option 5")),
      const DropdownMenuItem(value: "Option6", child: Text("Option 6")),
      const DropdownMenuItem(value: "Option7", child: Text("Option 7")),
    ];
    return menuFollowOnStatus;
  }

  String selectedStatus = "Open";
  String selectedStation = "Open";
  String selectedOption = "Open";
  String selectedReason = "Open";
  String selectedNextUnit = "Open";
  String selectedPartName = "Open";
  String selectedPartNumber = "Open";
  String selectedSNIn = "Open";
  String selectedSNOut = "Open";
  String selectedFollowOnStatus = "Open";

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
                        dateOccured: DateFormat.yMMMd()
                            .format(detailTask[0].dateOccur)
                            .toString(),
                        dueDate: DateFormat.yMMMd()
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
                      primary: const Color.fromRGBO(239, 173, 66, 1),
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
                                          primary: const Color.fromRGBO(
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
                      primary: Colors.white,
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
                      primary: const Color.fromRGBO(219, 219, 219, 1),
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
                        margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
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
                            margin: const EdgeInsets.fromLTRB(0, 15, 15, 10),
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
                            DropdownButtonFormField(
                                decoration: InputDecoration(
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
                                value: selectedReason,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedReason = newValue!;
                                  });
                                },
                                items: dropdownReason),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Next Unit')),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
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
                                value: selectedNextUnit,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedNextUnit = newValue!;
                                  });
                                },
                                items: dropdownNextUnit),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Part Name')),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
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
                                value: selectedPartName,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedPartName = newValue!;
                                  });
                                },
                                items: dropdownPartName),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Part Number')),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
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
                                value: selectedPartNumber,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedPartNumber = newValue!;
                                  });
                                },
                                items: dropdownPartNumber),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('SN.In')),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
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
                                value: selectedSNIn,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSNIn = newValue!;
                                  });
                                },
                                items: dropdownSNIn),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('SN.Out')),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
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
                                value: selectedSNOut,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedSNOut = newValue!;
                                  });
                                },
                                items: dropdownSNOut),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: const Text('Follow On Status')),
                            DropdownButtonFormField(
                                decoration: InputDecoration(
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
                                value: selectedFollowOnStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedFollowOnStatus = newValue!;
                                  });
                                },
                                items: dropdownFollowOnStatus)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 15, 50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(1, 98, 153, 1),
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
