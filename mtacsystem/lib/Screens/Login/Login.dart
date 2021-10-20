import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Screens/Register/Register.dart';
import 'package:mtacsystem/Components/logo.dart';

class LoginScreen extends StatelessWidget {
final _formKey = GlobalKey<FormState>();
bool _isObscure = true;
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
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Xin chào,",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF002FFF),
                  fontFamily: "Roboto",
                  fontSize: 36,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Vui lòng đăng nhập để sử dụng dịch vụ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF475DBB),
                  fontSize: 15
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.02),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
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
                child: TextButton(
                  child: Text(
                    "Quên mật khẩu?",
                    style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF475DBB)
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));// link qua trang quen mat khau
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),

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
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));//link qua trang dang ky
                  }, 
                  child: Text(
                    "Đăng ký tại đây.",
                    style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFF80000),
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
