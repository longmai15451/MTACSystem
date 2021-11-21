import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  int? gendervalue = 0;
  Gender({
    this.gendervalue,
  });
  @override
  State<Gender> createState() => _Gender(gendervalue: gendervalue);
}

class _Gender extends State<Gender> {
  final int? gendervalue;
  late String gender;
  _Gender({
    required this.gendervalue,
  });

  String getGender(int? gendervalue){
    if(gendervalue == 1) return 'Nữ';
    if(gendervalue == 2) return 'Khác';
    return 'Nam';
  }

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
          value: gender = getGender(gendervalue),
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
