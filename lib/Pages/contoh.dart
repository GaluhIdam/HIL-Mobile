// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:hil_mobile/Models/taskModel.dart';
// import 'package:hil_mobile/Services/config.dart';
// import 'package:hil_mobile/Services/taskService.dart';
// import 'package:hil_mobile/filter_modal.dart';
// import 'package:intl/intl.dart';
// import '../Widgets/cardTask.dart';
// import 'package:http/http.dart' as http;

// class TaskToDoPage extends StatefulWidget {
//   const TaskToDoPage({Key? key}) : super(key: key);
//   static const routeName = "/task_to_do_pages";

//   @override
//   State<TaskToDoPage> createState() => _TaskToDoPage();
// }

// enum SortBy { due, issue }

// class _TaskToDoPage extends State<TaskToDoPage> {
//   SortBy? _value = SortBy.due;

//   final controller = ScrollController();
//   List listTask = [];
//   bool hasMore = true;
//   int page = 1;

//   @override
//   void initState() {
//     super.initState();
//     // TaskService.getTask(page);
//     fetch();
//     controller.addListener(() {
//       if (controller.position.maxScrollExtent == controller.offset) {
//         fetch();
//         setState(() {
//           page++;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   static getURL() {
//     return Config.baseURL;
//   }

//   Future fetch() async {
//     // const limit = 10;
//     String urlTask = getURL() + 'task-list?page=$page';
//     final response = await http.get(Uri.parse(urlTask));
//     if (response.statusCode == 200) {
//       var json = jsonDecode(response.body);
//       final parsed = json['data']['data'].cast<Map<String, dynamic>>();

//       setState(() {
//         page++;
//         // if (listTask.length < limit) {
//         //   hasMore = false;
//         // }
//         listTask.addAll(parsed.map<String>((item) {
//           final number = [item['itemID'], item['acreg']];
//           return number;
//         }).toList());
//         // );
//       });
//     } else {
//       throw Exception('Failed to load task list');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: Container(
//       padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
//       child: Column(
//         children: <Widget>[
//           Container(
//               width: double.infinity,
//               margin: const EdgeInsets.fromLTRB(8, 20, 8, 0),
//               child: const Text(
//                 'Good Morning,',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: Color.fromRGBO(1, 98, 153, 1),
//                 ),
//               )),
//           Container(
//               margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
//               width: double.infinity,
//               child: const Text(
//                 'Sigit Prayoga',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(1, 98, 153, 1),
//                 ),
//               )),
//           Container(
//             margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
//             child: Row(
//               children: const [
//                 Text(
//                   '6618819',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Color.fromRGBO(1, 98, 153, 1),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 9,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Color.fromRGBO(209, 214, 217, 1),
//                   radius: 3,
//                 ),
//                 SizedBox(
//                   width: 9,
//                 ),
//                 Text(
//                   'TLC-7',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Color.fromRGBO(239, 173, 66, 1),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
//             child: Row(
//               children: [
//                 Flexible(
//                     child: TextField(
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       prefixIconColor: const Color.fromRGBO(1, 98, 153, 1),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                             color: Color.fromRGBO(1, 98, 153, 1)),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: const EdgeInsets.all(14),
//                       hintText: 'insert keyword'),
//                 )),
//                 filterData(context),
//                 sortData(context),
//               ],
//             ),
//           ),
//           Expanded(
//               child: Container(
//                   padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
//                   child: ListView.builder(
//                       controller: controller,
//                       itemCount: listTask.length + 1,
//                       itemBuilder: (context, index) {
//                         if (index < listTask.length) {
//                           final item = listTask[index];
//                           // return TaskCard(
//                           //     id: listTask[index].itemId.toString(),
//                           //     cardBackgroundColor: listTask[index].statusDesc,
//                           //     labelColor: listTask[index].statusDesc,
//                           //     labelText: listTask[index].statusDesc,
//                           //     title: listTask[index].acreg,
//                           //     code: listTask[index].itemId.isEmpty
//                           //         ? '-'
//                           //         : listTask[index].itemId,
//                           //     info: listTask[index].subject,
//                           //     dueDate: DateFormat('d MMM y')
//                           //         .format(listTask[index].dueDate),
//                           //     issueDate: DateFormat('d MMM y')
//                           //         .format(listTask[index].dateInsert),
//                           //     description: listTask[index].description);
//                           return ListTile(title: Text(item.toString()));
//                         } else {
//                           if (hasMore == true) {
//                             return const Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 32),
//                                 child: Center(
//                                   child: Text('no data to load'),
//                                 ));
//                           } else {
//                             return const Padding(
//                               padding: EdgeInsets.symmetric(vertical: 32),
//                               child: Center(
//                                 child: CircularProgressIndicator(),
//                               ),
//                             );
//                           }
//                         }
//                       })))
//         ],
//       ),
//     )));
//   }

//   GestureDetector filterData(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return StatefulBuilder(builder: (BuildContext context, setState) {
//                 return SizedBox(
//                   height: 700,
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
//                             child: const Text('Filter',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color.fromRGBO(1, 98, 153, 1),
//                                 )),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 15, 15, 0),
//                                 child: const Icon(Icons.close)),
//                           )
//                         ],
//                       ),
//                       Container(
//                           margin: const EdgeInsets.fromLTRB(15, 20, 0, 10),
//                           width: double.infinity,
//                           child: const Text(
//                             'Priority',
//                             style: TextStyle(fontSize: 14),
//                           )),
//                       Container(
//                         height: 40.0,
//                         margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
//                         width: double.infinity,
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: const [
//                             FilterModal(
//                               filterLabel: 'High',
//                               backgroundColor: Color.fromRGBO(181, 12, 12, 1),
//                               selectedColor: Color.fromRGBO(181, 12, 12, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'Low',
//                               backgroundColor: Color.fromRGBO(255, 200, 16, 1),
//                               selectedColor: Color.fromRGBO(255, 200, 16, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'Non',
//                               backgroundColor: Color.fromRGBO(159, 159, 159, 1),
//                               selectedColor: Color.fromRGBO(159, 159, 159, 1),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                           margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
//                           width: double.infinity,
//                           child: const Text(
//                             'A/C Registration',
//                             style: TextStyle(fontSize: 14),
//                           )),
//                       Container(
//                         height: 30.0,
//                         margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
//                         width: double.infinity,
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: const [
//                             FilterModal(
//                               filterLabel: 'PK-GJJ',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'PK-GWL',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'PK-JJK',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'PK-WWG',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'PK-AJJ',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                           margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
//                           width: double.infinity,
//                           child: const Text(
//                             'Subject',
//                             style: TextStyle(fontSize: 14),
//                           )),
//                       Container(
//                         height: 30.0,
//                         margin: const EdgeInsets.fromLTRB(15, 0, 0, 10),
//                         width: double.infinity,
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: const [
//                             FilterModal(
//                               filterLabel: 'Light',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'Equipment & Furnishing',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                             FilterModal(
//                               filterLabel: 'Cabin',
//                               selectedColor: Color.fromRGBO(1, 98, 153, 1),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromRGBO(66, 66, 66, 1),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8))),
//                             onPressed: () {},
//                             child: const Text(
//                               'Reset',
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   const Color.fromRGBO(1, 98, 153, 1),
//                               minimumSize: const Size.fromHeight(45),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             'Save',
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               });
//             });
//       },
//       child: Container(
//           margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(12)),
//           child: const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.filter_alt_outlined,
//               size: 30,
//               color: Color.fromRGBO(1, 98, 153, 1),
//             ),
//           )),
//     );
//   }

//   GestureDetector sortData(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return StatefulBuilder(builder: (BuildContext context, setState) {
//                 return Container(
//                   height: 320,
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(15, 15, 0, 10),
//                             child: const Text('Sort',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Color.fromRGBO(1, 98, 153, 1),
//                                 )),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                                 margin:
//                                     const EdgeInsets.fromLTRB(0, 15, 15, 10),
//                                 child: const Icon(Icons.close)),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: Column(
//                           children: [
//                             RadioListTile<SortBy>(
//                               title: const Text('By Due Date'),
//                               value: SortBy.due,
//                               groupValue: _value,
//                               onChanged: (SortBy? value) {
//                                 setState(() {
//                                   _value = value;
//                                 });
//                               },
//                             ),
//                             RadioListTile<SortBy>(
//                               title: const Text('By Issue Date'),
//                               value: SortBy.issue,
//                               groupValue: _value,
//                               onChanged: (SortBy? value) {
//                                 setState(() {
//                                   _value = value;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(15),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   const Color.fromRGBO(1, 98, 153, 1),
//                               minimumSize: const Size.fromHeight(45),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text(
//                             'Save',
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               });
//             });
//       },
//       child: Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(12)),
//           child: const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.sort_by_alpha,
//               size: 30,
//               color: Color.fromRGBO(1, 98, 153, 1),
//             ),
//           )),
//     );
//   }
// }
