import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  @override
  State<Gender> createState() => _Gender();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Gender extends State<Gender> {
  String gender = 'Nam';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: gender,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          gender = newValue!;
        });
      },
      items: <String>['Nam', 'Nữ', 'Khác']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
