import 'dart:ui';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/genderSelect.dart';
import 'package:mtacsystem/Components/dateTimePicker.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:mtacsystem/Screens/Register/ChosseHospital.dart';
import 'package:mtacsystem/controller/controllerData.dart';

class SignUpVaccin extends StatefulWidget {
  final AccountProfile accountdata;
  const SignUpVaccin({
    required this.accountdata,
  });
  @override
  State<SignUpVaccin> createState() => _SignUpVaccinState(accountdata: accountdata);
}

class _SignUpVaccinState extends State<SignUpVaccin> {
  TempUserProfile temp = new TempUserProfile();
  late bool _readonly = true;
  late AccountProfile accountdata;
  bool _expanded = false;
  final format = DateFormat("dd-MM-yyy");
  _SignUpVaccinState({required this.accountdata});
  @override
  initState(){
    
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(child: Row(
          children: [
            Container(child: Text("Đăng ký tiêm chủng")),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.white,width:1.5),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Center(child: Text('1',style: TextStyle(fontSize: 13))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.white,width:1.5),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
            ),
          ],
        )),
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
                                  Text(accountdata.fullName.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('Năm sinh: '+accountdata.birthDate.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('Giới Tính: '+(accountdata.gender=='0'?'Nam':accountdata.gender=='1'?'Nữ':'Khác'),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('SĐT: '+accountdata.phone.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('CCCD: '+accountdata.idCard.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                  Container(height: 5,),
                                  Text('Thẻ BHYT: '+accountdata.healthCard.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
                                ]
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 17.0),
                              child: Text('Địa chỉ: '+accountdata.address.toString()+', '+accountdata.ward.toString()+', '+accountdata.district.toString()+', '+accountdata.city.toString()+', '+accountdata.country.toString(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,)),
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
                              controller: temp.name = new TextEditingController(text: accountdata.fullName),
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
                                    child: dateTimePicker(),
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
                                    child: Gender(),
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
                              controller: temp.phone  = new TextEditingController(text: accountdata.phone),
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
                              controller: temp.idcard = new TextEditingController(text: accountdata.idCard),
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
                              controller: temp.healthCard = new TextEditingController(text: accountdata.healthCard),
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
                              controller: temp.job = new TextEditingController(text: accountdata.job),
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
                              controller: temp.city = new TextEditingController(text: accountdata.city),
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
                              controller: temp.district = new TextEditingController(text: accountdata.district),
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
                              controller: temp.ward = new TextEditingController(text: accountdata.ward),
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
                              controller: temp.address = new TextEditingController(text: accountdata.address),
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
                              controller: temp.nation = new TextEditingController(text: accountdata.nation),
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
                              controller: temp.country = new TextEditingController(text: accountdata.country),
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
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: RaisedButton(
                      onPressed: () {
                        
                        setState(() {
                        });
                        Get.to(ChosseHospital(accountdata: accountdata));
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
                                  Colors.blue.shade600,
                                  Colors.blue.shade300
                                ],
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topRight)),
                        padding: const EdgeInsets.all(0),
                        child: Text("Tiếp tục",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
