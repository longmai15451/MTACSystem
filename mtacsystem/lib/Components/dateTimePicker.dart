import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class dateTimePicker extends StatefulWidget {
  @override
  State<dateTimePicker> createState() => _dateTimePicker();
}

/// This is the private State class that goes with MyStatefulWidget.
class _dateTimePicker extends State<dateTimePicker> {
  TextEditingController _datecontrol = new TextEditingController();
  DateTime _date = DateTime.now();
  late var formattedDate = DateFormat('yyyy-MM-dd');
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
        ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          controller: _datecontrol,
          onTap: () {
            setState(() {
              _selectDate(context);
            });
          },
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 15),
          readOnly: true,
          decoration: InputDecoration(
            hintText: ('${formattedDate.format(_date)}'),
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
