import 'package:flutter/material.dart';

class StationChange extends StatelessWidget {
  final station;

  // ignore: use_key_in_widget_constructors
  const StationChange({
    required this.station,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, setState) {
      return DropdownButtonFormField(
          hint: Text('Please select status'),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(226, 234, 239, 1), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(226, 234, 239, 1), width: 2),
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
          items: station);
    });
  }
}
