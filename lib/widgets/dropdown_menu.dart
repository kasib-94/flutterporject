import 'package:flutter/material.dart';
import 'package:flutterporject/utils/models/models.dart';

class DropdownMenuExample<T extends DropDownModel> extends StatefulWidget {
  final List<T> elements;
  final String initialText;

  const DropdownMenuExample({Key? key, required this.elements, this.initialText = ""}) : super(key: key);

  @override
  State<DropdownMenuExample<T>> createState() => _DropdownMenuExampleState<T>();
}

class _DropdownMenuExampleState<T extends DropDownModel> extends State<DropdownMenuExample<T>> {
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.elements.map<DropdownMenuItem<String>>((T item) {
        return DropdownMenuItem<String>(
          value: item.dajId.toString(),
          child: Text(item.dajNazwa ?? ''),
        );
      }).toList(),
    );
  }
}
