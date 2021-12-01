import 'package:flutter/material.dart';

class NotifyContent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar:AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Thông báo',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Color(0xFF002FFF),
          fontFamily: "Roboto",
          fontSize: 36
        ),
        textAlign: TextAlign.center,
      ),
    ),
    body: ListView(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
              'Không có thông báo.'
            ),
        ),
      ],
    )
    );
  }
}