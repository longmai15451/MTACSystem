import 'package:flutter/material.dart';
import 'package:mtacsystem/server/Server.dart' as sver;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Screens/Register/Register.dart';
import 'package:mtacsystem/Components/logo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtacsystem/main.dart';
import 'forgotPassword.dart';
import 'package:mtacsystem/Network/Profiledata.dart';
import 'package:animations/animations.dart';


class LoginScreen extends StatefulWidget{

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login()async{
    var url=sver.serverip+"/CAP1_mobile/App_Login.php";
    var response = await http.post(Uri.parse(url),body: {
      "phone" : phone.text,
      "password" : pass.text,
    });
    var data = json.decode(response.body);
    if(data == "Error"){
      toast("Sai số điện thoại hoặc mật khẩu!", Colors.red);
    }else{
      toast("Đăng nhập thành công!", Colors.green,);
      accountdata = GetProfData.getdata(data);
        Get.to(MainScreen());
        setState((){
          
        });
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
      fontSize: 16.0
    );
  }

  Widget customLabel(String text, double fontsize, Color color){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 40),
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
  Widget build(BuildContext context){
    // Get phone screen size
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _formKey,
      resizeToAvoidBottomInset: true,
      appBar: Logo.getAppBar(),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            customLabel("Xin chào,",36,Color(0xFF002FFF)),
            SizedBox(height: size.height * 0.02),
            
            customLabel("Vui lòng đăng nhập để sử dụng dịch vụ",15,Color(0xFF475DBB)),
            SizedBox(height: size.height * 0.02),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
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
            SizedBox(height: size.height * 0.02),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: pass,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: "Mật khẩu",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off
                    ),
                    onPressed: (){
                      setState: ((){
                        _isObscure = !_isObscure;
                      });
                    }, 
                  )
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 50000),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                    Animation<double> secondanimation,
                  ){
                    return SharedAxisTransition(
                      fillColor: Colors.white,
                      child: child,
                      animation: animation,
                      secondaryAnimation: secondanimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                  },
                  child: TextButton(
                    child: Text(
                      "Quên mật khẩu?",
                      style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF475DBB),
                      ),
                    ),
                    onPressed: (){
                      Get.to(PasswordRetrive());// link qua trang quen mat khau
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  login();
                },
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
                      colors: [
                        Color.fromARGB(255, 0, 122, 255),
                        Color.fromARGB(188, 123, 255, 255),
                      ]
                    )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Đăng Nhập",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                )
              ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Text(
                  "Bạn chưa có tài khoản?",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF255EF0),
                    fontWeight: FontWeight.w500
                  ),
                ),
                PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                  ){
                    return SharedAxisTransition(
                      fillColor: Colors.white,
                      child:child,
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.vertical,
                    );
                  },
                  child: TextButton(
                    onPressed: (){
                      Get.to(RegisterScreen());//link qua trang dang ky
                    }, 
                    child: Text(
                      "Đăng ký tại đây.",
                      style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFF80000),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}
