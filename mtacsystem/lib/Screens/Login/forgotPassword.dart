import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'changePassword.dart';

class PasswordRetrive extends StatefulWidget{
  @override
  _PasswordRetrive createState() => _PasswordRetrive();
}

class _PasswordRetrive extends State<PasswordRetrive>{
  TextEditingController phone = TextEditingController();
  
  Future checkAccount()async{
    var url = "http://mtac1.000webhostapp.com/CAP1_mobile/Get_Information.php";
    var response = await http.post(Uri.parse(url),body: {
      "phone" : phone.text,
    });
    var data = json.decode(response.body);
    if(data == "Exist")
    {
      setState((){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(phone: phone.text,)));
      });
    }
    else
    {
      toast("Số điện thoại vẫn chưa đăng ký tài khoản!",Colors.red);
    }
  }

  void toast(String msg, Color textcolor) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[50],
      textColor: textcolor,
      fontSize: 16.0
    );
  }
  
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
                controller: phone,
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
                    checkAccount();
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