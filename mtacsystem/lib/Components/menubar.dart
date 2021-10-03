import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';

class MenuBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.home),
            highlightColor: Colors.blue[400],
          ),
        ),
        Container(
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.calendar_today),
            highlightColor: Colors.blue[400],
          ),
        ),
        
        Container(
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.qr_code_2_rounded),
            iconSize: 40.0,
            highlightColor: Colors.blue[400],
          ),
        ),
        Container(
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications),
            highlightColor: Colors.blue[400],
          ),
        ),
        Container(
          child: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(Icons.person),
            highlightColor: Colors.blue[400],
          ),
        )
      ],
    );
  }
}