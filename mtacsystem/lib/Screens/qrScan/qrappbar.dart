import 'package:flutter/material.dart';

class QRAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  const QRAppBar({
    required this.appBar,
  });
 @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
 }
 @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}