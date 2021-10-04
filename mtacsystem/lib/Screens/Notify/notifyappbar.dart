import 'package:flutter/material.dart';

class NotifyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  const NotifyAppBar({
    required this.appBar,
  });
 @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
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
    );
 }
 @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}