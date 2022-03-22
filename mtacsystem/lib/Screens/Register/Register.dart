import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/logo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cccd = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passcheck = TextEditingController();

  Future register() async {
    if (cccd.text.length != 9 && cccd.text.length != 12) {
      Fluttertoast.showToast(
          msg: "Số căn cước không hợp lệ!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[50],
          textColor: Colors.red,
          fontSize: 16.0);
    } else if (phone.text.length < 10 || phone.text.length > 11) {
      Fluttertoast.showToast(
          msg: "Số điện thoại không hợp lệ!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[50],
          textColor: Colors.red,
          fontSize: 16.0);
    } else if (pass.text.length < 8) {
      Fluttertoast.showToast(
          msg: "Mật khẩu phải trên 8 ký tự!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[50],
          textColor: Colors.red,
          fontSize: 16.0);
    } else if (pass.text != passcheck.text) {
      Fluttertoast.showToast(
          msg: "Mật khẩu xác nhận không trùng khớp!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[50],
          textColor: Colors.red,
          fontSize: 16.0);
    } else {
      var url = sver.serverip + "/CAP1_mobile/App_register.php";
      var response = await http.post(Uri.parse(url), body: {
        "full_name": name.text,
        "id_card": cccd.text,
        "phone": phone.text,
        "password": pass.text,
      });
      var data = json.decode(response.body);

      if (data == "Error") {
        Fluttertoast.showToast(
            msg: "Số điện thoại hoặc cccd này đã có tài khoản!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[50],
            textColor: Colors.red,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Đăng ký thành công!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[50],
            textColor: Colors.green,
            fontSize: 16.0);
        Timer(Duration(milliseconds: 50), () {
          Get.to(LoginScreen());
        });
      }
    }
  }

  Widget customLabel(String text, double fontsize, Color color) {
    return Container(
      alignment: Alignment.centerLeft,
      //padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: color,
          fontFamily: "Roboto",
          fontSize: fontsize,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 80),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Image.asset(
                    'assets/images/Splash.png',
                    width: 160.0,
                    height: 150.0,
                  ),
                  SizedBox(height: 10),
                  customLabel("Đăng ký tài khoản", 36, Colors.teal),
                  SizedBox(height: 10),
                  customLabel(
                      "Vui lòng nhập đầy đủ thông tin", 18, Colors.teal),
                  SizedBox(height: 20),

                  ///input Phone number
                  TextField(
                    controller: name,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: ('Họ và Tên'),
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
                    controller: phone,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: ('Số điện thoại'),
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
                    controller: cccd,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: ('CCCD/CMND'),
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
                    controller: pass,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: TextStyle(fontSize: 14, color: Colors.teal),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: ('Mật khẩu'),
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
                    controller: passcheck,
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
                  SizedBox(height: 20),
                  //SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 10),
                        child: TextButton(
                            child: Text(('Đăng nhập'),
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 17,
                                )),
                            onPressed: () {
                              Get.to(LoginScreen()); //link qua trang dang nhập
                            }),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: ElevatedButton(
                        child: Text(('Đăng ký tài khoản'),
                            style: TextStyle(fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            padding: EdgeInsets.all(15),
                            side: BorderSide(color: Colors.teal, width: 1.0)),
                        onPressed: () {
                          register();
                          
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // bool _isObscure = true;
    // Size size = MediaQuery.of(context).size;
    // return Scaffold(
    //   resizeToAvoidBottomInset : true,
    //   appBar: Logo.getAppBar(),
    //   body: Background(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         SizedBox(height: 20),
    //         Container(
    //           alignment: Alignment.centerLeft,
    //           padding: EdgeInsets.symmetric(horizontal: 40),
    //           child: Text(
    //             "Đăng Ký",
    //             style: TextStyle(
    //               fontWeight: FontWeight.w300,
    //               color: Color(0xFF0634FF),
    //               fontFamily: "Roboto",
    //               fontSize: 36
    //             ),
    //             textAlign: TextAlign.left,
    //           ),
    //         ),
    //         SizedBox(height: size.height * 0.01),

    //         Container(
    //           alignment: Alignment.centerLeft,
    //           margin: EdgeInsets.symmetric(horizontal: 40),
    //           child: Text(
    //             "Vui lòng cung cấp thông tin chính xác",
    //             style: TextStyle(
    //               color: Color(0xFF475DBB),
    //               fontSize: 16
    //             ),
    //             textAlign: TextAlign.left,
    //           ),
    //         ),
    //         SizedBox(height: size.height * 0.03),

    //         Container(
    //           alignment: Alignment.center,
    //           margin: EdgeInsets.symmetric(horizontal: 40),
    //           child: TextField(
    //             controller: name,
    //             decoration: InputDecoration(
    //               hintText: "Họ và tên",
    //             ),
    //             textCapitalization: TextCapitalization.sentences,
    //           ),
    //         ),
    //         SizedBox(height: size.height * 0.03),
    //         Container(
    //           alignment: Alignment.center,
    //           margin: EdgeInsets.symmetric(horizontal: 40),
    //           child: TextField(
    //             controller: cccd,
    //             decoration: InputDecoration(
    //               hintText: "Số CMNN/CCCD",
    //             ),
    //             keyboardType: TextInputType.number,
    //             inputFormatters: <TextInputFormatter>[
    //               WhitelistingTextInputFormatter.digitsOnly
    //             ],
    //           ),
    //         ),
    //         SizedBox(height: size.height * 0.03),
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
    //         SizedBox(height: size.height * 0.03),

    //         Container(
    //           alignment: Alignment.center,
    //           margin: EdgeInsets.symmetric(horizontal: 40),
    //           child: TextField(
    //             controller: pass,
    //             obscureText: _isObscure,
    //             decoration: InputDecoration(
    //               hintText: "Mật khẩu",
    //               suffixIcon: IconButton(
    //                 icon: Icon(
    //                   _isObscure ? Icons.visibility : Icons.visibility_off
    //                 ),
    //                 onPressed: (){
    //                   setState: ((){
    //                     _isObscure = !_isObscure;
    //                   });
    //                 },
    //               )
    //             ),
    //           ),
    //         ),
    //         SizedBox(height: size.height * 0.03),

    //         Container(
    //           alignment: Alignment.center,
    //           margin: EdgeInsets.symmetric(horizontal: 40),
    //           child: TextField(
    //             controller: passcheck,
    //             obscureText: _isObscure,
    //             decoration: InputDecoration(
    //               hintText: "Nhập lại mật khẩu",
    //               suffixIcon: IconButton(
    //                 icon: Icon(
    //                   _isObscure ? Icons.visibility : Icons.visibility_off
    //                 ),
    //                 onPressed: (){
    //                   setState: ((){
    //                     _isObscure = !_isObscure;
    //                   });
    //                 },
    //               )
    //             ),
    //           ),
    //         ),
    //         SizedBox(height: size.height * 0.03),

    //         Container(
    //           alignment: Alignment.center,
    //           margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    //           child: RaisedButton(
    //             onPressed: () {
    //               register();
    //             },
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(70.0)),
    //             textColor: Colors.white,
    //             padding: const EdgeInsets.all(0),
    //             child: Container(
    //               alignment: Alignment.center,
    //               height: 50.0,
    //               width: size.width * 0.5,
    //               decoration: new BoxDecoration(
    //                 borderRadius: BorderRadius.circular(70.0),
    //                 gradient: new LinearGradient(
    //                   colors: [
    //                     Color.fromARGB(255, 0, 122, 255),
    //                     Color.fromARGB(188, 123, 255, 255),
    //                   ]
    //                 )
    //               ),
    //               padding: const EdgeInsets.all(0),
    //               child: Text(
    //                 "Đăng Ký",
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                 )
    //               ),
    //             )
    //           ),
    //         ),

    //       ],
    //     )
    //   )
    // );
  }
}
