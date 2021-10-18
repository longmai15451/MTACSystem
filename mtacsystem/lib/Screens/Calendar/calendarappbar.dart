import 'package:flutter/material.dart';

class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appbar;
  const CalendarAppBar({
    required this.appbar,
  });
  @override
  Widget build(BuildContext context){
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Lịch Hẹn',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Color(0xFF002FFF),
          fontFamily: "Roboto",
          fontSize: 36
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appbar.preferredSize.height);
}
