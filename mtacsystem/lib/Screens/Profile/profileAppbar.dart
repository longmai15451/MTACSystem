import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appbar;
  const ProfileAppBar({
    required this.appbar,
  });
  @override
  Widget build(BuildContext context){
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.white,
      title: Row(
          children: <Widget>[
          IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.person),
            color: Colors.black,
            iconSize: 50.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Nguyễn Văn A', style: TextStyle(color: Colors.red)),
              Text('0987654321', style: TextStyle(color: Colors.red))
            ],
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(appbar.preferredSize.height);
}