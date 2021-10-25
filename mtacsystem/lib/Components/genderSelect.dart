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
    return Container(
      height: 55,
      width: 115,
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
        ),
        child: Container(
          child: DropdownButtonHideUnderline(
            child:DropdownButton<String>(
          value: gender,
          isDense: true,
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
      )
      ),
        )
      ),
    );
  }
}
