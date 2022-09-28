import 'package:flutter/material.dart';

class FilterModal extends StatefulWidget {
  final String filterLabel;
  final Color backgroundColor;
  final Color selectedColor;

  const FilterModal(
      {Key? key,
      this.filterLabel = '-',
      this.backgroundColor = Colors.black38,
      this.selectedColor = Colors.black38})
      : super(key: key);

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  var isSelected = false;
  List listFilter = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: FilterChip(
        backgroundColor: widget.backgroundColor,
        selectedColor: widget.selectedColor,
        label: Text(
          widget.filterLabel,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        checkmarkColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        selected: isSelected,
        onSelected: (bool value) {
          isSelected = value;
          setState(() {
            if (value) {
              listFilter.add(widget.filterLabel);
            } else {
              listFilter.removeWhere((value) {
                return widget.filterLabel == widget.filterLabel;
              });
            }
          });
        },
      ),
    );
  }
}
