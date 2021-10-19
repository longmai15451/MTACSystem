import 'dart:collection';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';

class SignUpVaccin extends StatelessWidget {
  final format = DateFormat("dd-MM-yyy");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Đăng ký tiêm chủng",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Thông tin đăng ký tiêm",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ),
                ),
              ],
            ),
             Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('Họ và tên '),
                      new Text("*", style: TextStyle(color: Colors.red),)
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
                      width: 130,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15),
                        // initialValue: 'Input text',
                        decoration: InputDecoration(
                          labelText: 'Giới tính',
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
              ],
            ), //Ngày Sinh Giới Tính
            //Số CMND
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
                  new Text('Số thẻ BHYT '),
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
                  hintText: 'Số thẻ bảo hiểm y tế',
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
                  new Text('Thời gian bạn muốn tiêm '),
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
                  labelText: 'Ngày đăng ký tiêm',
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
                  new Text('Nghề nghiệp '),
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
                  // labelText: 'Nghề nghiệp',
                  hintText: 'Nghề nghiệp',
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
                  // labelText: 'Nghề nghiệp',
                  // errorText: 'Error message', ------ báo lỗi k nhập
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Icon(
                    Icons.date_range,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
