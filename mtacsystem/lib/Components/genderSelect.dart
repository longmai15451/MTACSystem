import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  String accountgender;
  final bool readOnly;
  final Function getGenderController;
  Gender({required this.accountgender, required this.getGenderController, required this.readOnly});
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
      return gender=='female'?'Nữ':'Nam';
    }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 55,
          width: 115,
          child: InputDecorator(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),),
            ),
            child: Container(
              child: DropdownButtonHideUnderline(
                child:DropdownButton<String>(
              value: gender = getGender(widget.accountgender),
              isDense: true,
              onChanged: (String? newValue) {
                if(!widget.readOnly)
                  widget.getGenderController(newValue=='Nam'?'male':'female');
                setState(() {
                  gender = newValue!;
                });
              },
              items: <String>['Nam', 'Nữ']
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
