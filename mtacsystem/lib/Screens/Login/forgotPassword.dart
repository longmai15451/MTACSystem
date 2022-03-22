import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:flutter/services.dart';
import 'package:animations/animations.dart';
import 'package:mtacsystem/server/Server.dart' as sver;
import 'changePassword.dart';

class PasswordRetrive extends StatefulWidget {
  @override
  _PasswordRetrive createState() => _PasswordRetrive();
}

class _PasswordRetrive extends State<PasswordRetrive> {
  TextEditingController phone = TextEditingController();

  Future checkAccount() async {
    var url = sver.serverip + "/CAP1_mobile/Get_Information.php";
    var response = await http.post(Uri.parse(url), body: {
      "phone": phone.text,
    });
    var data = json.decode(response.body);
    if (data == "Exist") {
      setState(() {
        Get.to(ChangePassword(
          phone: phone.text,
        ));
      });
    } else {
      toast("Số điện thoại vẫn chưa đăng ký tài khoản!", Colors.red);
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55), // here the desired height
          child: AppBar(
            backgroundColor: Colors.teal,
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
          )),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/covid_background.jpg"),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/Splash.png',
                  width: 160.0,
                  height: 150.0,
                ),
                SizedBox(height: 10),
                Text(
                  'Xác nhận số điện thoại',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                      fontSize: 24),
                ),
                SizedBox(height: 20),

                ///input Phone number
                TextField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 14, color: Colors.teal),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: ('Số điện thoại'),
                      hintStyle: TextStyle(color: Colors.teal),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.teal, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.teal, width: 1.5),
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(height: 30),

                Center(
                  child: ElevatedButton(
                      child: Text(('Lấy lại mật khẩu'),
                          style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                          padding: EdgeInsets.all(15),
                          side: BorderSide(color: Colors.teal, width: 1.0)),
                      onPressed: () {
                        checkAccount();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.white,
    //       iconTheme: IconThemeData(color: Colors.black),
    //       elevation: 0.0,
    //       toolbarHeight: 80.0,
    //     ),
    //     body: Column(
    //       children: [
    //         Image.asset(
    //           'assets/images/Splash.png',
    //           width: 150.0,
    //           height: 140.0,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
    //           child: Container(
    //             child: Text(
    //               'Vui lòng nhập số điện thoại đã đăng ký!',
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
    //             controller: phone,
    //             decoration: InputDecoration(
    //               hintText: "Số điện thoại",
    //             ),
    //             keyboardType: TextInputType.number,
    //             inputFormatters: <TextInputFormatter>[
    //               WhitelistingTextInputFormatter.digitsOnly
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(12.0),
    //           child: Container(
    //             alignment: Alignment.center,
    //             margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    //             child: PageTransitionSwitcher(
    //               duration: const Duration(milliseconds: 50000),
    //               transitionBuilder:(
    //                 Widget child,
    //                 Animation<double> animation,
    //                 Animation<double> secondaryAnimation,
    //               ){
    //                 return SharedAxisTransition(
    //                   fillColor: Colors.white,
    //                   child:child,
    //                   animation: animation,
    //                   secondaryAnimation: secondaryAnimation,
    //                   transitionType: SharedAxisTransitionType.horizontal,
    //                 );
    //               },
    //               child:   RaisedButton(
    //                 onPressed: () {
    //                   checkAccount();
    //                 },
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(70.0)),
    //                 textColor: Colors.white,
    //                 padding: const EdgeInsets.all(0),
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   height: 50.0,
    //                   width: 150,
    //                   decoration: new BoxDecoration(
    //                     borderRadius: BorderRadius.circular(70.0),
    //                     gradient: new LinearGradient(
    //                       colors: [
    //                         Color.fromARGB(255, 0, 122, 255),
    //                         Color.fromARGB(188, 123, 255, 255),
    //                       ]
    //                     )
    //                   ),
    //                   padding: const EdgeInsets.all(0),
    //                   child: Text(
    //                     "Lấy lại mật khẩu",
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                     )
    //                   ),
    //                 )
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    // );
  }
}
