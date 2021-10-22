import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/Components/globalsVar.dart' as globals;
Widget _LoginStatus(bool status){
  if(status){
    return Row(
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
      );
  }
  return Row(
          children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Vui lòng đăng nhập để sử dụng dịch vụ!', 
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w300
                )),
            ],
          ),
        ],
      );
}

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
          if(!globals.loginStatus)
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        icon: Icon(Icons.person),
        color: Colors.black,
        iconSize: 50.0,
      ),
      title: _LoginStatus(globals.loginStatus),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

}
