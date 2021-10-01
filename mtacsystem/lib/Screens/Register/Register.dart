import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    // Get phone screen size
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Đăng Ký",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF0634FF),
                  fontFamily: "Roboto",
                  fontSize: 36
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),


          ],
        )
      )
    );
  }
}