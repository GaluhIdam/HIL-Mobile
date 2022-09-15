import 'package:flutter/material.dart';

class OptionChange extends StatelessWidget {
  final dataOption;

  // ignore: use_key_in_widget_constructors
  const OptionChange({required this.dataOption});

  @override
  Widget build(BuildContext context) {
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
                      hint: Text('Please select option'),
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
                          fillColor: const Color.fromRGBO(226, 234, 239, 1),
                          contentPadding: const EdgeInsets.all(13)),
                      onChanged: (String? newValue) {
                        setState(() {
                          newValue!;
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
                    primary: const Color.fromRGBO(1, 98, 153, 1),
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
