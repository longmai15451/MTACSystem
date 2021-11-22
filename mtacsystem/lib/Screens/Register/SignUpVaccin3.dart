import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Screens/Register/ChosseHospital.dart';

class SignUpVaccin3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký tiêm chủng"),
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 350,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Phiếu đồng ý",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        gradient: new LinearGradient(
                          colors: [Colors.blue.shade600, Colors.blue.shade300],
                          begin: FractionalOffset.bottomLeft,
                          end: FractionalOffset.topRight
                        )
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Xác nhận",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
