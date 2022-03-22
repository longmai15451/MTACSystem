import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRegister extends StatefulWidget {
  final Function getControllerText;
  final Function dateUpdate;
  const DateRegister(
      {Key? key, required this.getControllerText, required this.dateUpdate})
      : super(key: key);

  @override
  State<DateRegister> createState() => _DateRegister();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DateRegister extends State<DateRegister> {
  DateTime _date = DateTime.now();
  late var formattedDate = DateFormat('yyyy-MM-dd');
  bool _decideWhichDayToEnable(DateTime day) {
    // set ngày hiện tại đến 10 ngày sau
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

  Future<Null> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: _date, // ngày hiện tại
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
      widget.getControllerText('${formattedDate.format(_date)}');
      await widget.dateUpdate();
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
        style: TextStyle(fontSize: 16),
        readOnly: true,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
            hintText: ('${formattedDate.format(_date)}'),
            hintStyle: TextStyle(color: Colors.black),
            icon: Icon(Icons.date_range,color: Colors.teal, size: 30)),
      ),
    );
  }
}
