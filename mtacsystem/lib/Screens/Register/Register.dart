import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/logo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';


class RegisterScreen extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passcheck = TextEditingController();

  Future register()async{
    if(pass.text!=passcheck.text){
      Fluttertoast.showToast(
        msg: "Mật khẩu xác nhận không giống!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[50],
        textColor: Colors.red,
        fontSize: 16.0
      );
    }
    else{
      var url="http://mtac1.000webhostapp.com/citizen_register.php";
      var response = await http.post(Uri.parse(url),body: {
        "Name" : name.text,
        "Phone_num" : phone.text,
        "password" : pass.text,
      });
      var data = json.decode(response.body);
      
      if(data == "Error"){
        Fluttertoast.showToast(
          msg: "Số điện thoại này đã có tài khoản đăng ký!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[50],
          textColor: Colors.red,
          fontSize: 16.0
        );
      }else{
        Fluttertoast.showToast(
          msg: "Đăng ký thành công!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[50],
          textColor: Colors.green,
          fontSize: 16.0
        );
        Timer(Duration(milliseconds: 50),(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context){
    // Get phone screen size
    bool _isObscure = true;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : true,
      appBar: Logo.getAppBar(),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
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
            SizedBox(height: size.height * 0.01),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Vui lòng cung cấp thông tin chính xác",
                style: TextStyle(
                  color: Color(0xFF475DBB),
                  fontSize: 16
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Họ và tên",
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            SizedBox(height: size.height * 0.03),

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
            SizedBox(height: size.height * 0.03),

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
            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passcheck,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: "Nhập lại mật khẩu",
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
            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  register();
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
                    "Đăng Ký",
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
      )
    );
  }
}