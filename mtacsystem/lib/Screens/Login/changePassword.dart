import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

import 'Login.dart';

class ChangePassword extends StatefulWidget {
  final String phone;
  const ChangePassword({
    required this.phone,
  });
  @override
  _ChangePassword createState() => _ChangePassword(phone: phone);
}

class _ChangePassword extends State<ChangePassword> {
  final String phone;
  _ChangePassword({
    required this.phone,
  });
  TextEditingController password = TextEditingController();
  TextEditingController checkPassword = TextEditingController();

  Future changePass() async {
    if (password.text.length < 8) {
      toast("Mật khẩu phải trên 8 ký tự!", Colors.red);
    } else if (checkPassword.text != password.text) {
      toast("Mật khẩu xác nhận không trùng khớp!", Colors.red);
    } else {
      var url = sver.serverip + "/CAP1_mobile/Change_password.php";
      var response = await http.post(Uri.parse(url), body: {
        "phone": phone,
        "password": password.text,
      });
      var data = json.decode(response.body);
      if (data == "Success") {
        toast("Đã thay đổi mật khẩu, vui lòng đăng nhập để sử dụng.",
            Colors.green);
        Timer(Duration(milliseconds: 50), () {
          Get.to(LoginScreen());
        });
      } else {
        toast("Hệ thống đang gặp sự cố, vui lòng thử lại sau!", Colors.red);
      }
    }
  }

  void toast(String msg, Color textcolor) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[50],
        textColor: textcolor,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          toolbarHeight: 55.0,
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/covid_background.jpg"),
                    fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Splash.png',
                      width: 160.0,
                      height: 150.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Vui lòng nhập mật khẩu mới!',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    SizedBox(height: 20),

                    ///input Phone number
                    TextField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(fontSize: 14, color: Colors.teal),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: ('Mật khẩu mới'),
                          hintStyle: TextStyle(color: Colors.teal),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 1.5),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: checkPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(fontSize: 14, color: Colors.teal),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: ('Xác nhận mật khẩu'),
                          hintStyle: TextStyle(color: Colors.teal),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.teal, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 1.5),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: ElevatedButton(
                          child: Text(('Đổi mật khẩu'),
                              style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              padding: EdgeInsets.all(15),
                              side: BorderSide(color: Colors.teal, width: 1.0)),
                          onPressed: () {
                            changePass();
                          }),
                    ),
                  ],
                ),
              ),
            )));
    // return Scaffold(
    //   appBar: AppBar(
    //       backgroundColor: Colors.white,
    //       iconTheme: IconThemeData(color: Colors.black),
    //       elevation: 0.0,
    //       toolbarHeight: 80.0,
    //     ),
    //     body: ListView(
    //       children: [
    //         Image.asset(
    //           'assets/images/Splash.png',
    //           width: 150.0,
    //           height: 140.0,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 50.0, bottom: 30.0,left: 40),
    //           child: Container(
    //             child: Text(
    //               'Vui lòng nhập mật khẩu mới!',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.w500,
    //                 color: Color(0xFF475DBB),
    //                 fontSize: 18
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           margin: EdgeInsets.symmetric(horizontal: 40),
    //           child: TextField(
    //             obscureText: true,
    //             controller: password,
    //             decoration: InputDecoration(
    //               hintText: "Mật khẩu mới",
    //             ),
    //           ),
    //         ),
    //         Container(
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           margin: EdgeInsets.symmetric(horizontal: 40),
    //           child: TextField(
    //             obscureText: true,
    //             controller: checkPassword,
    //             decoration: InputDecoration(
    //               hintText: "Xác nhận mật khẩu",
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(12.0),
    //           child: Container(
    //             alignment: Alignment.center,
    //             margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    //             child: RaisedButton(
    //               onPressed: () {
    //                 changePass();
    //               },
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(70.0)),
    //               textColor: Colors.white,
    //               padding: const EdgeInsets.all(0),
    //               child: Container(
    //                 alignment: Alignment.center,
    //                 height: 50.0,
    //                 width: 150,
    //                 decoration: new BoxDecoration(
    //                   borderRadius: BorderRadius.circular(70.0),
    //                   gradient: new LinearGradient(
    //                     colors: [
    //                       Color.fromARGB(255, 0, 122, 255),
    //                       Color.fromARGB(188, 123, 255, 255),
    //                     ]
    //                   )
    //                 ),
    //                 padding: const EdgeInsets.all(0),
    //                 child: Text(
    //                   "Thay đổi mật khẩu",
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                   )
    //                 ),
    //               )
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    // );
  }
}
