import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/main.dart';
import 'package:mtacsystem/Components/globalsVar.dart' as globals;
Widget _LoginStatus(bool status,BuildContext context){
  if(status){
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          IconButton(
            onPressed: (){
              globals.loginStatus=false;
              Navigator.pop(context);
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.black,
            iconSize: 30.0,
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
      backgroundColor: Colors.blue.shade200,
      elevation: 0.0,
      leading: IconButton(
        onPressed: (){
          if(!globals.loginStatus)
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        icon: Icon(Icons.person),
        color: Colors.black,
        iconSize: 50.0,
      ),
      title: _LoginStatus(globals.loginStatus,context),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

}
