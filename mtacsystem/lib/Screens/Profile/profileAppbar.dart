import 'package:flutter/material.dart';


class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appbar;
  const ProfileAppBar({
    required this.appbar,
  });
  @override
  Widget build(BuildContext context){
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.blue.shade200,
      title: Padding(
        padding: const EdgeInsets.only(left: 280.0),
        child: Container(
          child: IconButton(
            onPressed: () async{
                Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
            iconSize: 40.0,
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(appbar.preferredSize.height-20);
}