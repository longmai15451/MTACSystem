import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtacsystem/Components/controllerData.dart';

class DateRegister extends StatefulWidget {
  final VacRegister regisdata;

  const DateRegister({Key? key, required this.regisdata}) : super(key: key);
  @override
  State<DateRegister> createState() => _DateRegister(regisdata: regisdata);
}

/// This is the private State class that goes with MyStatefulWidget.
class _DateRegister extends State<DateRegister> {
  final VacRegister regisdata;
  DateTime _date = DateTime.now();
  late var formattedDate = DateFormat('yyyy-MM-dd');

  _DateRegister({required this.regisdata});
  bool _decideWhichDayToEnable(DateTime day) {  // set ngày hiện tại đến 10 ngày sau
  if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
      day.isBefore(DateTime.now().add(Duration(days: 10))))) {
    return true;
  }
  return false;
}
  Future<Null> _selectDate(BuildContext context) async{
    DateTime? _datePicker = await showDatePicker(
      context: context, 
      initialDate: _date, // ngày hiện tại
      firstDate: DateTime(1990), 
      lastDate: DateTime(2050),
      selectableDayPredicate: _decideWhichDayToEnable,
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
          controller: regisdata.registerDate,
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
            icon: Icon(Icons.date_range)
          ),
        ),
    );
  }
}
