import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mtacsystem/controller/controllerData.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class EditProfile extends StatefulWidget {
  final AccountProfile accountdata;

  const EditProfile({Key? key, required this.accountdata}) : super(key: key);
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  late var formattedDate = DateFormat('yyyy-MM-dd');
  TempUserProfile temp = new TempUserProfile(); 
  int count = 0;
  late String gd = 'Nam';
  late DateTime _date= DateTime.parse(widget.accountdata.birthDate.toString());

  @override
  initState(){
    super.initState();
    _settempData();
  }

  void _settempData(){
    temp.name = new TextEditingController(text: widget.accountdata.fullName);
    temp.birthdate = new TextEditingController(text: formattedDate.format(_date));
    temp.phone  = new TextEditingController(text: widget.accountdata.phone);
    temp.idcard = new TextEditingController(text: widget.accountdata.idCard);
    temp.email = new TextEditingController(text: widget.accountdata.email);
    temp.nation = new TextEditingController(text: widget.accountdata.nation);
    temp.job = new TextEditingController(text: widget.accountdata.job);
    temp.healthCard = new TextEditingController(text: widget.accountdata.healthCard);
    temp.city = new TextEditingController(text: widget.accountdata.city);
    temp.district = new TextEditingController(text: widget.accountdata.district);
    temp.ward = new TextEditingController(text: widget.accountdata.ward);
    temp.address = new TextEditingController(text: widget.accountdata.address);
    temp.country = new TextEditingController(text: widget.accountdata.country);
  }

  Future<Null> _selectDate(BuildContext context) async{
    DateTime? _datePicker = await showDatePicker(
      context: context, 
      initialDate: _date, // ngày hiện tại
      firstDate: DateTime(1900), 
      lastDate: DateTime(2050),
    );
    if(_datePicker != null && _datePicker != _date){
      setState(() {
        _date = _datePicker;
        
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
  
  String getGender(AccountProfile data){
    count==0?temp.gender = new TextEditingController(text:data.gender):{};
    count=1;
    return temp.gender.text=='female'?'Nữ':'Nam';
  }

  void tempProfileUpdate(){
      widget.accountdata.fullName = temp.name.text;
      widget.accountdata.birthDate = temp.birthdate.text;
      widget.accountdata.gender = temp.gender.text;
      widget.accountdata.phone = temp.phone.text;
      widget.accountdata.idCard = temp.idcard.text;
      widget.accountdata.email = temp.email.text;
      widget.accountdata.job = temp.job.text;
      widget.accountdata.healthCard = temp.healthCard.text;
      widget.accountdata.city = temp.city.text;
      widget.accountdata.district = temp.district.text;
      widget.accountdata.ward = temp.ward.text;
      widget.accountdata.address = temp.address.text;
      widget.accountdata.country = temp.country.text;
      toast('Cập nhật thành công!', Colors.green);
      Get.back(result: widget.accountdata);
  }

  Future<void> updateProfile() async{
    var url=sver.serverip+"/CAP1_mobile/UpdateProfile.php";
    var response = await http.post(Uri.parse(url),body: {
      "old_id_card" : widget.accountdata.idCard.toString(),
      "full_name" : temp.name.text,
      "id_card" : temp.idcard.text,
      "phone" : temp.phone.text,
      "birthdate" : temp.birthdate.text,
      "gender" : temp.gender.text,
      "healthCard" : temp.healthCard.text,
      "email" : temp.email.text,
      "job" : temp.job.text,
      "address" : temp.address.text,
      "ward" : temp.ward.text,
      "district" : temp.district.text,
      "city" : temp.city.text,
      "country" : temp.country.text,
      "nation" : temp.nation.text,
    });
    var data = json.decode(response.body);
    if(data == "Success"){
      tempProfileUpdate();
    }
    else{
      toast('Đã có lỗi xảy ra. Vui lòng thử lại', Colors.red);
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin cá nhân'),
          
        ),
        body: 
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50.0),
                              )),
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
                                    border: Border.all(
                                        color: Colors.white, width: 1.5),
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
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: TextField(
                                  controller: temp.name,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  // initialValue: 'Input text',
                                  decoration: InputDecoration(
                                    hintText: 'Họ và tên ',
                                    // errorText: 'Error message', ------ báo lỗi k nhập
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        margin: EdgeInsets.only(
                                            left: 20, right: 10),
                                        child: Container(
                                          child: TextField(
                                            controller: temp.birthdate = new TextEditingController(text: formattedDate.format(_date)),
                                            onTap: () {
                                              setState(() {
                                                _selectDate(context);
                                              });
                                            },
                                            keyboardType: TextInputType.text,
                                            style: TextStyle(fontSize: 15),
                                            readOnly: true,
                                            decoration: InputDecoration(
                                              hintText: ('${formattedDate.format(_date)}'),
                                              // errorText: 'Error message', ------ báo lỗi k nhập
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10)),
                                              suffixIcon: Icon(
                                                Icons.error,
                                              ),
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 21, vertical: 5),
                                        child: Container(
                                              height: 55,
                                              width: 115,
                                              child: InputDecorator(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10)),
                                                ),
                                                child: Container(
                                                  child: DropdownButtonHideUnderline(
                                                    child:DropdownButton<String>(
                                                  value: gd = getGender(widget.accountdata),
                                                  isDense: true,
                                                  onChanged: (String? newValue) {
                                                    temp.gender.text = newValue=='Nam'?'male':'female';
                                                    print(temp.gender.text);
                                                    setState(() {
                                                      gd = newValue!;
                                                    });
                                                  },
                                                  items: <String>['Nam', 'Nữ']
                                                      .map<DropdownMenuItem<String>>((String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                              )
                                              ),
                                            )
                                          ),
                                        ),
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
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: TextField(
                                  controller: temp.phone,
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
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: TextField(
                                  controller: temp.idcard,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  // initialValue: 'Input text',
                                  decoration: InputDecoration(
                                    hintText: 'Sổ hộ chiếu/CMND/CCCD',
                                    // errorText: 'Error message', ------ báo lỗi k nhập
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Email ')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.email,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.nation,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Dân tộc',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.job,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Nghề nghiệp',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.healthCard,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Số thẻ BHYT',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.city,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Tỉnh/Thành phố',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.district,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Quận/Huyện',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.ward,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Phường/Xã',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Địa chỉ '),
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
                                      controller: temp.address,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Địa chỉ',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      controller: temp.country,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Quốc tịch',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 10),
                                        child: RaisedButton(
                                            onPressed: () {
                                               updateProfile();
                                              setState(() {
                                               
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        70.0)),
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.all(0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 50.0,
                                              width: size.width * 0.5,
                                              decoration: new BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          70.0),
                                                  gradient: new LinearGradient(
                                                      colors: [
                                                        Colors.blue.shade600,
                                                        Colors.blue.shade300
                                                      ],
                                                      begin: FractionalOffset
                                                          .bottomLeft,
                                                      end: FractionalOffset
                                                          .topRight)),
                                              padding: const EdgeInsets.all(0),
                                              child: Text("Cập nhật",
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}
