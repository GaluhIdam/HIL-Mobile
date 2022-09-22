import 'package:flutter/material.dart';
import 'package:hil_mobile/Pages/task_details_page.dart';
import 'package:hil_mobile/Services/optionService.dart';

// ignore: must_be_immutable
class OptionChange extends StatelessWidget {
  List<DropdownMenuItem<String>> dataOption;
  dynamic optionID, token, itemId;
  // ignore: use_key_in_widget_constructors
  OptionChange({
    required this.dataOption,
    required this.optionID,
    required this.token,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return SizedBox(
          height: 270,
          child: optionID == null || optionID == 'null'
              ? Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Form(
                    key: formKey,
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
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 15, 15, 10),
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
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: const Text('Change Option to')),
                              DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select option';
                                    }
                                    return null;
                                  },
                                  hint: Text('Please select option'),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                226, 234, 239, 1),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                226, 234, 239, 1),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          226, 234, 239, 1),
                                      contentPadding: const EdgeInsets.all(13)),
                                  onChanged: (dynamic newValue) {
                                    setState(() {
                                      optionID = newValue!;
                                    });
                                  },
                                  items: dataOption)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(1, 98, 153, 1),
                                minimumSize: const Size.fromHeight(45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.pop(context);
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                      content: Text('Updating data...')),
                                );
                                OptionService.updateOption(
                                        itemId, token, optionID)
                                    .then((value) {
                                  print(value);
                                });
                              }
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
                  ))
              : Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Form(
                    key: formKey,
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
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 15, 15, 10),
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
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: const Text('Change Option to')),
                              optionID == '' || optionID == 'null'
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
                                      onChanged: (dynamic newValue) {
                                        setState(() {
                                          newValue!;
                                        });
                                      },
                                      items: dataOption)
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
                                      value: optionID,
                                      onChanged: (dynamic newValue) {
                                        setState(() {
                                          optionID = newValue!;
                                        });
                                      },
                                      items: dataOption),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(1, 98, 153, 1),
                                minimumSize: const Size.fromHeight(45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                      content: CircularProgressIndicator()),
                                );
                                OptionService.updateOption(
                                        itemId, token, optionID)
                                    .then((value) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          value['message'],
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  );

                                  Navigator.pushNamed(
                                      context, TaskDetailsPage.routeName,
                                      arguments: {
                                        "itemId": value['id'].toString(),
                                      });

                                  print(value);
                                  print(optionID);
                                });
                              }
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
                  )));
    });
  }
}
