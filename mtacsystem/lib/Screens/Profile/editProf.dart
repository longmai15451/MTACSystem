import 'package:flutter/cupertino.dart';

import 'package:mtacsystem/Components/genderSelect.dart';
import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget{
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile>{
  bool _isObscure=false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.blue.shade200,
            child: Column(
              children: <Widget>[
                Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Center(
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Center(
                          child: Text('Chỉnh sửa thông tin', 
                          style: TextStyle(
                            color: Colors.red
                            )
                          ),
                        )
                      ),
                      Container(
                        height: 50,
                        child: Center(
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              child: Text('Lưu  '),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0,1.0),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(150.0),
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(color:Colors.white,width:1.5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                              'assets/images/Splash.png',
                              ),
                            ),
                          ),
                        ),
                      ),
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
                                      Icons.calendar_today,
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
                       //Ngày Sinh Giới Tính
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('Số điện thoại '),
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
                            hintText: 'Số điện thoại',
                            // errorText: 'Error message', ------ báo lỗi k nhập
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Mật Khẩu '),
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Mật Khẩu',
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
                                // errorText: 'Error message', ------ báo lỗi k nhập
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('Sổ hộ chiếu/CMND/CCCD '),
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
                            hintText: '',
                            // errorText: 'Error message', ------ báo lỗi k nhập
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Dân tộc '),
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
                                hintText: 'Dân tộc',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Nghề nghiệp '),
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
                                hintText: 'Nghề nghiệp',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Số thẻ BHYT '),
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
                                hintText: 'Số thẻ BHYT',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Tỉnh/Thành phố '),
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
                                hintText: 'Tỉnh/Thành phố',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Quận/Huyện '),
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
                                hintText: 'Quận/Huyện',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Phường/Xã '),
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
                                hintText: 'Phường/Xã',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Địa chỉ '),
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
                                hintText: 'Địa chỉ',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Quốc tịch '),
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
                                hintText: 'Quốc tịch',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}