import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordRetrive extends StatefulWidget{
  @override
  _PasswordRetrive createState() => _PasswordRetrive();
}

class _PasswordRetrive extends State<PasswordRetrive>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          toolbarHeight: 80.0,
        ),
        body: Column(
          children: [
            Image.asset(
              'assets/images/Splash.png',
              width: 150.0,
              height: 140.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
              child: Container(
                child: Text(
                  'Vui lòng nhập số điện thoại đã đăng ký!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475DBB),
                    fontSize: 18
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Số điện thoại",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: 150,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(70.0),
                      gradient: new LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 122, 255),
                          Color.fromARGB(188, 123, 255, 255),
                        ]
                      )
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "Lấy lại mật khẩu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
    );
  }
}