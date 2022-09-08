import 'package:flutter/material.dart';
import 'package:hil_mobile/Providers/taskProvider.dart';
import 'package:hil_mobile/filter_modal.dart';
import 'package:intl/intl.dart';
import '../Widgets/cardTask.dart';
import '../models/taskModel.dart';

enum SortBy { due, issue }

class TaskToDoPage extends StatelessWidget {
  static const routeName = "/task_to_do_pages";
  SortBy? _value = SortBy.due;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(8, 20, 8, 0),
              child: const Text(
                'Good Morning,',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(1, 98, 153, 1),
                ),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              width: double.infinity,
              child: const Text(
                'Sigit Prayoga',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(1, 98, 153, 1),
                ),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            child: Row(
              children: const [
                Text(
                  '6618819',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(1, 98, 153, 1),
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(209, 214, 217, 1),
                  radius: 3,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  'TLC-7',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(239, 173, 66, 1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: const Color.fromRGBO(1, 98, 153, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(1, 98, 153, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.all(14),
                      hintText: 'Masukan kata kunci'),
                )),
                filterData(context),
                sortData(context),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                  child: FutureBuilder<List<Datum>>(
                      future: TaskProvider.getTask(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          List<Datum> listTask = snapshot.data!;
                          if (listTask.isEmpty) {
                            return const Text('Data not available!');
                          } else {
                            return ListView.builder(
                                itemCount: listTask.length,
                                itemBuilder: (context, index) {
                                  return TaskCard(
                                      id: listTask[index].id.toString(),
                                      cardBackgroundColor:
                                          listTask[index].optionName,
                                      labelColor: listTask[index].optionName,
                                      labelText: listTask[index].optionName,
                                      title:
                                          listTask[index].aircraftRegistration,
                                      code: listTask[index].itemId,
                                      info: listTask[index].subject,
                                      dueDate: listTask[index].statusName,
                                      issueDate: DateFormat.yMd()
                                          .format(listTask[index].dueDate),
                                      description: listTask[index].description);
                                });
                          }
                        } else {
                          return const Center(
                            child: Text('Connection failed!'),
                          );
                        }
                      })))
        ],
      ),
    )));
  }

  GestureDetector filterData(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, setState) {
                return SizedBox(
                  height: 700,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: const Text('Filter',
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
                                margin: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                                child: const Icon(Icons.close)),
                          )
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 20, 0, 10),
                          width: double.infinity,
                          child: const Text(
                            'Priority',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 40.0,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FilterModal(
                              filterLabel: 'High',
                              backgroundColor: Color.fromRGBO(181, 12, 12, 1),
                              selectedColor: Color.fromRGBO(181, 12, 12, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Low',
                              backgroundColor: Color.fromRGBO(255, 200, 16, 1),
                              selectedColor: Color.fromRGBO(255, 200, 16, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Non',
                              backgroundColor: Color.fromRGBO(159, 159, 159, 1),
                              selectedColor: Color.fromRGBO(159, 159, 159, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                          width: double.infinity,
                          child: const Text(
                            'A/C Registration',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 30.0,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FilterModal(
                              filterLabel: 'PK-GJJ',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-GWL',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-JJK',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-WWG',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'PK-AJJ',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                          width: double.infinity,
                          child: const Text(
                            'Subject',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        height: 30.0,
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            FilterModal(
                              filterLabel: 'Light',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Equipment & Furnishing',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                            FilterModal(
                              filterLabel: 'Cabin',
                              selectedColor: Color.fromRGBO(1, 98, 153, 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(66, 66, 66, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: () {},
                            child: const Text(
                              'Reset',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
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
      },
      child: Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_alt_outlined,
              size: 30,
              color: Color.fromRGBO(1, 98, 153, 1),
            ),
          )),
    );
  }

  GestureDetector sortData(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (BuildContext context, setState) {
                return Container(
                  height: 320,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                            child: const Text('Sort',
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
                                margin:
                                    const EdgeInsets.fromLTRB(0, 15, 15, 10),
                                child: const Icon(Icons.close)),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            RadioListTile<SortBy>(
                              title: const Text('By Due Date'),
                              value: SortBy.due,
                              groupValue: _value,
                              onChanged: (SortBy? value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                            RadioListTile<SortBy>(
                              title: const Text('By Issue Date'),
                              value: SortBy.issue,
                              groupValue: _value,
                              onChanged: (SortBy? value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
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
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.sort_by_alpha,
              size: 30,
              color: Color.fromRGBO(1, 98, 153, 1),
            ),
          )),
    );
  }
}
