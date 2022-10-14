import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hil_mobile/Services/filterService.dart';
import 'package:hil_mobile/Services/authService.dart';
import 'package:hil_mobile/filter_modal.dart';

class DropDownSearch extends StatefulWidget {
  const DropDownSearch({super.key});

  @override
  State<DropDownSearch> createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  List<String> acreg = [];
  List<String> actype = [];
  List<String> status = [];
  List<String> customer = [];
  List<String> category = [];
  List filterList = [];

  List<String> filterAcreg = [];
  List<String> filterActype = [];
  List<String> filterStatus = [];
  List<String> filterCustomer = [];
  List<String> filterCategory = [];

  String? token;

  @override
  void initState() {
    super.initState();
    AuthService.hasToken().then((item) {
      setState(() {
        token = item['token'];
      });
      FilterService.getAcreg(token).then((item) {
        for (var i = 0; i < item.length; i++) {
          acreg.add(item[i]['acreg'].toString());
        }
      });
      FilterService.getActype(token).then((item) {
        for (var i = 0; i < item.length; i++) {
          actype.add(item[i]['ACType'].toString());
        }
      });
      FilterService.getCategory(token).then((item) {
        for (var i = 0; i < item.length; i++) {
          category.add(item[i]['CategoryDesc'].toString());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 20, 0, 20),
                  child: Text(
                    'Filter by :',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 25, 20),
                      child: const Icon(Icons.close)),
                )),
          ],
        ),
        SizedBox(
          height: 50,
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                FilterModal(
                  filterLabel: 'High',
                  backgroundColor: Color.fromRGBO(181, 12, 12, 1),
                  selectedColor: Color.fromRGBO(181, 12, 12, 1),
                ),
                FilterModal(
                  filterLabel: 'Medium',
                  backgroundColor: Color.fromARGB(255, 255, 116, 16),
                  selectedColor: Color.fromARGB(255, 255, 116, 16),
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
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('A/C Registration'),
            )),
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: DropdownSearch<String>.multiSelection(
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    fillColor: const Color.fromRGBO(226, 234, 239, 1),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            items: acreg,
            selectedItems: filterAcreg.isNotEmpty ? filterAcreg : filterAcreg,
            popupProps: PopupPropsMultiSelection.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                title: Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select A/C Registration',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            onChanged: (value) {
              filterAcreg.addAll(value);
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('A/C Type'),
            )),
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: DropdownSearch<String>.multiSelection(
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    fillColor: const Color.fromRGBO(226, 234, 239, 1),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            items: actype,
            popupProps: PopupPropsMultiSelection.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                title: Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select A/C Type',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            onChanged: (value) {
              filterActype.addAll(value);
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Customer'),
            )),
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: DropdownSearch<String>.multiSelection(
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    fillColor: const Color.fromRGBO(226, 234, 239, 1),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            items: customer,
            popupProps: PopupPropsMultiSelection.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                title: Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select Customer',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            onChanged: (value) {
              filterCustomer.addAll(value);
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Status'),
            )),
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: DropdownSearch<String>.multiSelection(
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    fillColor: const Color.fromRGBO(226, 234, 239, 1),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            items: status,
            popupProps: PopupPropsMultiSelection.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                title: Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select Status',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            onChanged: (value) {
              filterStatus.addAll(value);
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Category'),
            )),
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: DropdownSearch<String>.multiSelection(
            dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    fillColor: const Color.fromRGBO(226, 234, 239, 1),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            items: category,
            popupProps: PopupPropsMultiSelection.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                title: Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select Category',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            onChanged: (value) {
              filterCategory.addAll(value);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 30, 25, 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(1, 98, 153, 1),
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              filterList.add({
                'acreg': filterAcreg,
                'actype': filterActype,
                'customer': filterCustomer,
                'status': filterStatus,
                'category': filterCategory
              });
            },
            child: const Text(
              'Filter',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 0, 25, 40),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 153, 1, 1),
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              filterAcreg.clear();
              filterActype.clear();
              filterCustomer.clear();
              filterStatus.clear();
              filterCategory.clear();
              filterList.clear();
            },
            child: const Text(
              'Reset',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
