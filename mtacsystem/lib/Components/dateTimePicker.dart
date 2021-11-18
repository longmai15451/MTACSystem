import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class dateTimePicker extends StatefulWidget {
  @override
  State<dateTimePicker> createState() => _dateTimePicker();
}

/// This is the private State class that goes with MyStatefulWidget.
class _dateTimePicker extends State<dateTimePicker> {
  DateTime _date = DateTime.now();
  
  Future<Null> _selectDate(BuildContext context) async{
    DateTime? _datePicker = await showDatePicker(
      context: context, 
      initialDate: _date, // ngày hiện tại
      firstDate: DateTime(1900), 
      lastDate: DateTime(2050),
    );
    if(_datePicker != null && _datePicker != _date){
      setState(() {
        _date = _datePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          onTap: () {
            setState(() {
              _selectDate(context);
            });
          },
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 15),
          readOnly: true,
          decoration: InputDecoration(
            hintText: (_date.toString()),
            // errorText: 'Error message', ------ báo lỗi k nhập
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)),
            suffixIcon: Icon(
              Icons.error,
            ),
          ),
        ),
    );
  }
}
