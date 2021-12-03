import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/dateTimePicker.dart';
import 'package:mtacsystem/Components/genderSelect.dart';
import 'package:mtacsystem/Screens/Register/ChooseTest.dart';
import 'package:mtacsystem/controller/controllerData.dart';
import 'package:mtacsystem/models/account.dart';

class SignUpTest extends StatefulWidget {
  final AccountProfile accountdata;
  const SignUpTest({
    required this.accountdata,
  });
  @override
  State<SignUpTest> createState() => _SignUpTest();
}
class _SignUpTest extends State<SignUpTest>{
  late bool check1;
  TempUserProfile temp = new TempUserProfile();
  late bool _readonly = true;
  bool _expanded = false;
  final format = DateFormat("dd-MM-yyy");
  @override
  initState(){
    temp.birthdate.text = widget.accountdata.birthDate.toString();
    temp.gender.text = widget.accountdata.gender.toString();
    setState((){
      check1=false;
    });
    super.initState();
  }

  void _getControllerText(String text){
    setState((){
      temp.birthdate.text = text;
    });
  }
  void getGenderController(String value){
    setState((){
      temp.gender.text = value;
    });
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
            Row(
              children: <Widget>[
                Container(
                  width: 350,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Thông tin đăng ký tiêm",
                    style: TextStyle(
                        color: Colors.blue.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Text(
              'Vui lòng kiểm tra thông tin trước khi đăng ký.', 
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto"),
              textAlign: TextAlign.center,
            ),
            ExpansionPanelList(
                elevation: 0,
                animationDuration: Duration(milliseconds: 2000),
                children: [
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text('Thông tin người dùng', style: TextStyle(color: Colors.black),),
                              trailing:Text(_expanded?'Chi tiết':'Ẩn bớt'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(height: 10,),
                                  Text(widget.accountdata.fullName.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('Năm sinh: '+widget.accountdata.birthDate.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('Giới Tính: '+(widget.accountdata.gender=='0'?'Nam':widget.accountdata.gender=='1'?'Nữ':'Khác'),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('SĐT: '+widget.accountdata.phone.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('CCCD: '+widget.accountdata.idCard.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('Thẻ BHYT: '+widget.accountdata.healthCard.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17.0),
                              child: Text('Địa chỉ: '+widget.accountdata.address.toString()+', '+widget.accountdata.ward.toString()+', '+widget.accountdata.district.toString()+', '+widget.accountdata.city.toString()+', '+widget.accountdata.country.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                            ),

                          ],
                        );
                      },
                      body: Column(
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
                              controller: temp.name = new TextEditingController(text: widget.accountdata.fullName),
                              readOnly: _readonly,
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
                                    child: dateTimePicker(getControllerText: _getControllerText,readOnly: _readonly),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(color: Colors.red)
                                    // ),
                                    margin: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                                    child: Gender(accountgender: temp.gender.text, getGenderController: getGenderController,readOnly: _readonly),
                                  ),
                                ],
                              ),
                            ],
                          ), //Ngày Sinh Giới Tính
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
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextField(
                              controller: temp.phone  = new TextEditingController(text: widget.accountdata.phone),
                              readOnly: _readonly,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 15),
                              // initialValue: 'Input text',
                              decoration: InputDecoration(
                                hintText: 'Số điện thoại',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(10)),
                              ),
                            ),
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
                              controller: temp.idcard = new TextEditingController(text: widget.accountdata.idCard),
                              readOnly: _readonly,
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
                                
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: TextFormField(
                              controller: temp.healthCard = new TextEditingController(text: widget.accountdata.healthCard),
                              readOnly: _readonly,
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
                              controller: temp.job = new TextEditingController(text: widget.accountdata.job),
                              readOnly: _readonly,
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
                              controller: temp.city = new TextEditingController(text: widget.accountdata.city),
                              readOnly: _readonly,
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
                              controller: temp.district = new TextEditingController(text: widget.accountdata.district),
                              readOnly: _readonly,
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
                              controller: temp.ward = new TextEditingController(text: widget.accountdata.ward),
                              readOnly: _readonly,
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
                              controller: temp.address = new TextEditingController(text: widget.accountdata.address),
                              readOnly: _readonly,
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
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Dân tộc '),
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
                              controller: temp.nation = new TextEditingController(text: widget.accountdata.nation),
                              readOnly: _readonly,
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
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('Quốc tịch '),
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
                              controller: temp.country = new TextEditingController(text: widget.accountdata.country),
                              readOnly: _readonly,
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
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {
    
                  });
                },
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
                        Get.to(ChooseTest( accountdata: widget.accountdata,));
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