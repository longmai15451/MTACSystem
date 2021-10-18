import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  const HomeAppBar({
    required this.appBar,
  });
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        icon: Icon(Icons.person),
        color: Colors.black,
        iconSize: 50.0,
      ),
      title: Row(
          children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Xin Chào,', 
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300
                )),
              Text('Nguyễn Văn A', 
              style: TextStyle(color: Colors.black))
            ],
          ),
        ],
      ),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  // static getHomeAppBar(BuildContext context){
  //   return AppBar(
  //     toolbarHeight: 80.0,
  //     backgroundColor: Colors.white,
  //     title: Row(
  //         children: <Widget>[
  //         IconButton(
  //           onPressed: (){
  //             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  //           },
  //           icon: Icon(Icons.person),
  //           color: Colors.black,
  //           iconSize: 50.0,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text('Xin Chào,', style: TextStyle(color: Colors.red)),
  //             Text('Nguyễn Văn A', style: TextStyle(color: Colors.red))
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
