import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/account.dart';
import 'package:mtacsystem/Screens/Profile/editProf.dart';


class HomeAppBar extends StatefulWidget implements PreferredSizeWidget{
  final AccountProfile accountdata;
  final AppBar appBar;
  const HomeAppBar({
    required this.accountdata,
    required this.appBar,
  });
 @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.blue.shade200,
      elevation: 0.0,
      leading: IconButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> EditProfile(accountdata: widget.accountdata,))).then((value) => {setState((){})});
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
              Text(widget.accountdata.fullName.toString(), 
              style: TextStyle(color: Colors.black))
            ],
          ),
        ],
      ),
    );
  }

 
}
