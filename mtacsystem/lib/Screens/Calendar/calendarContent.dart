import 'package:flutter/material.dart';

class CalendarContent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(// khi có dữ liệu thì sẽ thay thế bằng ListView
      alignment: Alignment.center,
      child: Text(
          'Không có thông báo.'
        ),
    );
  }
}