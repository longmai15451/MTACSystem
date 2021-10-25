import 'package:flutter/material.dart';

class CalendarAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appbar;
  const CalendarAppBar({
    required this.appbar,
  });
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
          toolbarHeight: 300.0,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(child: Text('Lịch hẹn hôm nay',style:TextStyle(color:Colors.red[400])),height: 30,),
              Tab(child: Text('Lịch sử',style:TextStyle(color:Colors.red[400])),height: 30,),
            ],
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Lịch Hẹn',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Color(0xFFF7153B),
              fontFamily: "Roboto",
              fontSize: 36
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: TabBarView(children: <Widget>[
          ListView(),
          ListView(),
        ],),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appbar.preferredSize.height);
}