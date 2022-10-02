import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/acregModel.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:hil_mobile/filter_modal.dart';
import 'package:http/http.dart' as http;

class FilterAcreg extends StatefulWidget {
  const FilterAcreg({super.key});

  @override
  State<FilterAcreg> createState() => _FilterAcregState();
}

class _FilterAcregState extends State<FilterAcreg> {
  final token = '16|F1AOo347Jg6wG2P3nnDOtkT25FAOtG4ApTXLAkXY';
  final acregController = ScrollController();
  List<DataAcreg> acregList = [];
  int page = 1;
  @override
  void initState() {
    super.initState();
    acreg(token);
    acregController.addListener(() {
      if (acregController.position.maxScrollExtent == acregController.offset) {
        acreg(token);
      }
    });
  }

  @override
  void dispose() {
    acregController.dispose();
    super.dispose();
  }

  getURL() {
    return Config.baseURL;
  }

  Future acreg(String token) async {
    String urlAcreg = getURL() + 'master-acreg';
    final response = await http
        .get(Uri.parse(urlAcreg), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data']['data'];
      setState(() {
        page++;
        acregList.addAll(
            parsed.map<DataAcreg>((json) => DataAcreg.fromJson(json)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  filterLabel: 'Medium',
                  backgroundColor: Color.fromARGB(255, 228, 82, 14),
                  selectedColor: Color.fromARGB(255, 228, 82, 14),
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
            child: ListView.builder(
              controller: acregController,
              scrollDirection: Axis.horizontal,
              itemCount: acregList.length,
              itemBuilder: ((context, index) {
                if (index < acregList.length) {
                  final data = acregList[index];
                  return FilterModal(
                    filterLabel: data.acreg,
                    selectedColor: Color.fromRGBO(1, 98, 153, 1),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
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
                    backgroundColor: const Color.fromRGBO(66, 66, 66, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  setState(() {
                    acregList.clear();
                  });
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(1, 98, 153, 1),
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
  }
}
