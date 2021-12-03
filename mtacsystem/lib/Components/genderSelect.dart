import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  String accountgender;
  final Function getGenderController;
  Gender({required this.accountgender, required this.getGenderController});
  @override
  State<Gender> createState() => _Gender();
}

class _Gender extends State<Gender> {
  late String gender ='Nam';
  
  @override
  initState(){
    gender = getGender(widget.accountgender);
    super.initState();
  }
  String getGender(String gender){
      return gender=='1'?'Nữ':gender=='0'?'Nam':'Khác';
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
              value: gender = getGender(widget.accountgender),
              isDense: true,
              onChanged: (String? newValue) {
                widget.getGenderController(newValue=='Nam'?'0':newValue=='Nữ'?'1':'null');
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
          )
            )));
  }
}
