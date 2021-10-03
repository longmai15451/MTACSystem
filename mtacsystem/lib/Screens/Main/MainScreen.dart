import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/menubar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold( 
         appBar: AppBar(
          toolbarHeight: 80.0,
          backgroundColor: Colors.white,
          title: Row(
              children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.person),
                color: Colors.black,
                iconSize: 50.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Xin Chào,', style: TextStyle(color: Colors.red)),
                  Text('Nguyễn Văn A', style: TextStyle(color: Colors.red))
                ],
              ),
            ],
          ),
         ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
                 Container(
                   child: RaisedButton(
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                 ),
               ],
             ),
           ],
         ),
         bottomNavigationBar: MenuBar(),
      );
   }
}