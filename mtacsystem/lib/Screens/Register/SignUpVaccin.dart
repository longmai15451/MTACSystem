import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';


class SignUpVaccin extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Đăng ký tiêm chủng",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Thông tin đăng ký tiêm",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"
                ),
              ),
            ),
            
            // -------line-------- 
            Container(
              width: 320,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide( //                    <--- top side
                    color: Colors.grey,
                    width: 1.0,
                 ),
                ),
              ),
            ),
            Container(
              
            ),
          ],
        ),
      ),
    );
  }
  
}
