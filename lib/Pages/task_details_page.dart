import 'package:flutter/material.dart';
import 'package:hil_mobile/Providers/taskProvider.dart';
import 'package:intl/intl.dart';
import '../Widgets/detailTask.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({Key? key}) : super(key: key);
  static const routeName = "/task_details_pages";
  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPage();
}

class _TaskDetailsPage extends State<TaskDetailsPage> {
  // TaskDetailsPageState({Key? key}) : super(key: key);
  List<DropdownMenuItem<String>> get dropdownStatus {
    List<DropdownMenuItem<String>> menuStatus = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuStatus;
  }

  List<DropdownMenuItem<String>> get dropdownStation {
    List<DropdownMenuItem<String>> menuStation = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuStation;
  }

  List<DropdownMenuItem<String>> get dropdownOption {
    List<DropdownMenuItem<String>> menuOption = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuOption;
  }

  List<DropdownMenuItem<String>> get dropdownReason {
    List<DropdownMenuItem<String>> menuReason = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuReason;
  }

  List<DropdownMenuItem<String>> get dropdownNextUnit {
    List<DropdownMenuItem<String>> menuNextUnit = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuNextUnit;
  }

  List<DropdownMenuItem<String>> get dropdownPartName {
    List<DropdownMenuItem<String>> menuPartName = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuPartName;
  }

  List<DropdownMenuItem<String>> get dropdownPartNumber {
    List<DropdownMenuItem<String>> menuPartNumber = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuPartNumber;
  }

  List<DropdownMenuItem<String>> get dropdownSNIn {
    List<DropdownMenuItem<String>> menuSNIn = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuSNIn;
  }

  List<DropdownMenuItem<String>> get dropdownSNOut {
    List<DropdownMenuItem<String>> menuSNOut = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
    ];
    return menuSNOut;
  }

  List<DropdownMenuItem<String>> get dropdownFollowOnStatus {
    List<DropdownMenuItem<String>> menuFollowOnStatus = [
      const DropdownMenuItem(child: Text("Open"), value: "Open"),
      const DropdownMenuItem(child: Text("Option 1"), value: "Option1"),
      const DropdownMenuItem(child: Text("Option 2"), value: "Option2"),
      const DropdownMenuItem(child: Text("Option 3"), value: "Option3"),
      const DropdownMenuItem(child: Text("Option 4"), value: "Option4"),
      const DropdownMenuItem(child: Text("Option 5"), value: "Option5"),
      const DropdownMenuItem(child: Text("Option 6"), value: "Option6"),
      const DropdownMenuItem(child: Text("Option 7"), value: "Option7"),
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
    final idx = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: FutureBuilder<dynamic>(
                future: TaskProvider.getTaskDetail(idx),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    final detailTask = snapshot.data!;
                    print(detailTask);
                    if (snapshot.data == null) {
                      return const Text('Data not available!');
                    } else {
                      return DetailTask(
                        itemId: detailTask['item_id'],
                        subject: detailTask['subject'],
                        flightNumber: detailTask['flight_number'],
                        aircraftType: detailTask['aircraft_type'],
                        aircraftRegistration:
                            detailTask['aircraft_registration'],
                        station: detailTask['station'],
                        ata: detailTask['ata'],
                        sequenceNumber: detailTask['sequence_number'],
                        dateOccured: detailTask['date_occured'],
                        dueDate: detailTask['due_date'],
                        stationCode: detailTask['station_code'],
                        faultCode: detailTask['fault_code'],
                        categoryName: detailTask['category_name'],
                        techlog: detailTask['techlog'],
                        ref: detailTask['ref'],
                        refDdg: detailTask['ref_ddg'],
                        option: detailTask['option'].toString(),
                        status: detailTask['status'].toString(),
                        description: detailTask['description'],
                        partNumber: detailTask['part_number'],
                        partName: detailTask['part_name'],
                        statusName: detailTask['status_name'],
                        optionName: detailTask['option_name'],
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
                    changeStatusModal(context);
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
                    changeOptionModal(context);
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

  Future<dynamic> changeStatusModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return SizedBox(
              height: 600,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                        child: const Text('Change HIL Status',
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
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: const Text('Change Description')),
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
                            child: const Text('Change Status to')),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
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
                            value: selectedStatus,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedStatus = newValue!;
                              });
                            },
                            items: dropdownStatus),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: const Text('Station Close')),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
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
                            value: selectedStation,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedStation = newValue!;
                              });
                            },
                            items: dropdownStation)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
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
              ),
            );
          });
        });
  }

  Future<dynamic> changeOptionModal(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return SizedBox(
              height: 310,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                        child: const Text('Change HIL Option',
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
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: const Text('Change Option to')),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
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
                            value: selectedOption,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption = newValue!;
                              });
                            },
                            items: dropdownOption),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
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
              ),
            );
          });
        });
  }
}
