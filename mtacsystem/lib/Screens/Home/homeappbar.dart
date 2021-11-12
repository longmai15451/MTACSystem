import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/account.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AccountProfile accountdata;
  final AppBar appBar;
  const HomeAppBar({
    required this.accountdata,
    required this.appBar,
  });
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.blue.shade200,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () async{
          // if(!globals.loginStatus)
          //   {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(selected: 4)));
          //   }
        },
        icon: Icon(Icons.person),
        color: Colors.black,
        iconSize: 50.0,
      ),
      title:Row(
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
              Text(accountdata.fullName.toString(), 
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

}
