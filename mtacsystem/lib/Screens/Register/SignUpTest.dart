import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/genderSelect.dart';
import 'package:mtacsystem/Screens/Register/ChooseTest.dart';

class SignUpTest extends StatefulWidget {
  @override
  State<SignUpTest> createState() => _SignUpTest();
}
class _SignUpTest extends State<SignUpTest>{
  late bool check1;
  late bool check2;
  late bool check3;
  late bool check4;
  late bool check5;

  @override
  initState(){
    setState((){
      check1=check2=check3=check4=check5=false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký xét nghiệm"),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Họ và tên '),
                  new Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                // initialValue: 'Input text',
                decoration: InputDecoration(
                  hintText: 'Họ và tên',
                  // errorText: 'Error message', ------ báo lỗi k nhập
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Icon(
                    Icons.error,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('Ngày sinh '),
                      new Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 130, top: 10),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('Giới tính '),
                      new Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 170,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                        readOnly: true,
                        // initialValue: 'Input text',
                        decoration: InputDecoration(
                          hintText: 'Ngày sinh',
                          // errorText: 'Error message', ------ báo lỗi k nhập
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: Icon(
                            Icons.error,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                      child: Gender(),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Số hộ chiếu/CMNN/CCCD '),
                  new Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                // initialValue: 'Input text',
                decoration: InputDecoration(
                  labelText: 'Số CMND',
                  // errorText: 'Error message', ------ báo lỗi k nhập
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Icon(
                    Icons.error,
                  ),
                ),
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Tỉnh/Thành phố '),
                  new Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                readOnly: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                // initialValue: 'Input text',
                decoration: InputDecoration(
                  hintText: 'Tỉnh/Thành phố',
                  // errorText: 'Error message', ------ báo lỗi k nhập
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Quận/Huyện '),
                  new Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                // initialValue: 'Input text',
                decoration: InputDecoration(
                  hintText: 'Quận/Huyện',
                  // errorText: 'Error message', ------ báo lỗi k nhập
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Phường/Xã '),
                  new Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                // initialValue: 'Input text',
                decoration: InputDecoration(
                  hintText: 'Phường/Xã',
                  // errorText: 'Error message', ------ báo lỗi k nhập
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('Địa chỉ nơi ở '),
                  new Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                // initialValue: 'Input text',
                decoration: InputDecoration(
                  hintText: 'Nhập nội dung',
                  // errorText: 'Error message', ------ báo lỗi k nhập
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: new Row(
                      children: <Widget>[
                        
                        Row(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                  margin: EdgeInsets.only(top: 10),
                                    child: new Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Lựa chọn loại xét nghiệm '),
                                        new Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      RaisedButton(
                                        onPressed: (){
                                              setState((){
                                                check1 = false;
                                              });
                                            },
                                            highlightColor: Colors.transparent,
                                            color: Colors.white,
                                            elevation: 0.0,
                                            splashColor: Colors.transparent,

                                        child: Container(
                                          child: Row(
                                          children: [
                                            Icon(check1?Icons.radio_button_off : Icons.radio_button_on, 
                                            size: 20,
                                            color: check1?Colors.black : Colors.blue,
                                            ),
                                            Text('  Test nhanh'),
                                        ],
                                        ),)
                                      ),
                                      RaisedButton(
                                        onPressed: (){
                                              setState((){
                                                check1 = true;
                                              });
                                            },
                                            highlightColor: Colors.transparent,
                                            color: Colors.white,
                                            elevation: 0.0,
                                            splashColor: Colors.transparent,

                                        child: Container(
                                          child: Row(
                                          children: [
                                            Icon(!check1?Icons.radio_button_off : Icons.radio_button_on, 
                                            size: 20,
                                            color: !check1?Colors.black : Colors.blue,
                                            ),
                                            Text('  PCR'),
                                        ],
                                        ),)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ), 
                  ),
                ],
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: RaisedButton(
                    onPressed: () {
                        Get.to(ChooseTest());
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
                          colors: [Colors.blue.shade600, Colors.blue.shade300],
                          begin: FractionalOffset.bottomLeft,
                          end: FractionalOffset.topRight
                        )
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Tiếp tục",
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
        )
      ),
    );
  }
}