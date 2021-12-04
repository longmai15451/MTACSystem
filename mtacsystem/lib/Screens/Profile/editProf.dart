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
    _setAnamnesis();
  }

  void _setAnamnesis(){
    temp.anamnesis[0] = new TextEditingController(text: widget.accountdata.anamnesis1);
    temp.anamnesis[1] = new TextEditingController(text: widget.accountdata.anamnesis2);
    temp.anamnesis[2] = new TextEditingController(text: widget.accountdata.anamnesis3);
    temp.anamnesis[3] = new TextEditingController(text: widget.accountdata.anamnesis4);
    temp.anamnesis[4] = new TextEditingController(text: widget.accountdata.anamnesis5);
    temp.anamnesis[5] = new TextEditingController(text: widget.accountdata.anamnesis6);
    temp.anamnesis[6] = new TextEditingController(text: widget.accountdata.anamnesis7);
    temp.anamnesis[7] = new TextEditingController(text: widget.accountdata.anamnesis8);
    temp.anamnesis[8] = new TextEditingController(text: widget.accountdata.anamnesis9);
    temp.anamnesis[9] = new TextEditingController(text: widget.accountdata.anamnesis10);
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

  void tempAnamnesisUpdate(){
    widget.accountdata.anamnesis1 = temp.anamnesis[0].text;
    widget.accountdata.anamnesis2 = temp.anamnesis[1].text;
    widget.accountdata.anamnesis3 = temp.anamnesis[2].text;
    widget.accountdata.anamnesis4 = temp.anamnesis[3].text;
    widget.accountdata.anamnesis5 = temp.anamnesis[4].text;
    widget.accountdata.anamnesis6 = temp.anamnesis[5].text;
    widget.accountdata.anamnesis7 = temp.anamnesis[6].text;
    widget.accountdata.anamnesis8 = temp.anamnesis[7].text;
    widget.accountdata.anamnesis9 = temp.anamnesis[8].text;
    widget.accountdata.anamnesis10 = temp.anamnesis[9].text;
    toast('Cập nhật thành công!', Colors.green);
  }

  Future<void> updateProfile() async{
    var url="http://mtac1.000webhostapp.com/CAP1_mobile/UpdateProfile.php";
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

  Future<void> updateAnamnesis() async {
    var url="http://mtac1.000webhostapp.com/CAP1_mobile/UpdateAnamnesis.php";
    var response = await http.post(Uri.parse(url),body: {
      "id_card" : widget.accountdata.idCard.toString(),
      "anamnesis1" : temp.anamnesis[0].text,
      "anamnesis2" : temp.anamnesis[1].text,
      "anamnesis3" : temp.anamnesis[2].text,
      "anamnesis4" : temp.anamnesis[3].text,
      "anamnesis5" : temp.anamnesis[4].text,
      "anamnesis6" : temp.anamnesis[5].text,
      "anamnesis7" : temp.anamnesis[6].text,
      "anamnesis8" : temp.anamnesis[7].text,
      "anamnesis9" : temp.anamnesis[8].text,
      "anamnesis10" : temp.anamnesis[9].text,
    });
    var data = json.decode(response.body);
    if(data == "Success"){
      tempAnamnesisUpdate();
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
          bottom: TabBar(tabs: <Widget>[
            Tab(child: Text('Thông tin cá nhân')),
            Tab(child: Text('Tiền sử bệnh')),
          ]),
        ),
        body: TabBarView(children: <Widget>[
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
                                  controller: temp.name = new TextEditingController(text: widget.accountdata.fullName),
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
                                                    temp.gender = new TextEditingController(text: newValue=='Nam'?'male':'female',);
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
                                  controller: temp.phone  = new TextEditingController(text: widget.accountdata.phone),
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
                                  controller: temp.idcard = new TextEditingController(text: widget.accountdata.idCard),
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
                                      controller: temp.email = new TextEditingController(text: widget.accountdata.email),
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
                                      controller: temp.nation = new TextEditingController(text: widget.accountdata.nation),
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
                                      controller: temp.job = new TextEditingController(text: widget.accountdata.job),
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
                                      controller: temp.healthCard = new TextEditingController(text: widget.accountdata.healthCard),
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
                                      controller: temp.city = new TextEditingController(text: widget.accountdata.city),
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
                                      controller: temp.district = new TextEditingController(text: widget.accountdata.district),
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
                                      controller: temp.ward = new TextEditingController(text: widget.accountdata.ward),
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
                                      controller: temp.address = new TextEditingController(text: widget.accountdata.address),
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
                                      controller: temp.country = new TextEditingController(text: widget.accountdata.country),
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
          ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(left: 5, top: 10, bottom: 10),
                          width: 350,
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.black26,
                                style: BorderStyle.solid,
                                width: 1),
                            columnWidths: {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(color: Colors.blue),
                                  children: [
                                    TableCell(
                                        child: SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          'Tiền sử',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                    TableCell(
                                        child: SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          'Có',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                    TableCell(
                                        child: SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          'Không',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                  ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '1. Tiền sử phản vệ từ độ 2 trở lên',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[0] = new TextEditingController(text: '1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[0].text == '0')
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[0].text == '0')
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[0] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[0].text == '1')
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[0].text == '1' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '2. Tiền sử bị Covid-19 trong vòng 6 tháng',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[1] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[1].text == '0')
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[1].text == '0' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[1] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[1].text == '1')
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[1].text == '1')
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '3. Tiền sử tiêm vắc xin khác trong 14 ngày qua',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[2] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[2].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[2].text == '0')
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[2] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[2].text == '1')
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[2].text == '1')
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 50,
                                          child: Text(
                                              '4. Tiền sử suy giảm miễn dịch, ung thư giai đoạn cuối, cắt lách, xơ gan mất bù...',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[3] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[3].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[3].text == '0' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[3] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[3].text == '1' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[3].text == '1' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 100,
                                          child: Text(
                                              '5. Đang dùng thuốc ức chế miễn dịch, corticoid liều cao (tương đương hoặc hơn 2mg prednisonlon/kg/ngày trong ít nhất 7 ngày) hoặc điều trị hoá trị, xạ trị',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[4] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[4].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[4].text == '0' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[4] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[4].text == '1' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[4].text == '1' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: SizedBox(
                                          height: 30,
                                          child: Text('6. Bệnh cấp tính',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[5] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[5].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[5].text == '0' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[5] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[5].text == '1' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[5].text == '1' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '7. Tiền sử bệnh mã tính, đang tiến triển',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[6] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[6].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[6].text == '0' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[6] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[6].text == '1' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[6].text == '1' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '8. Tiền sử bệnh mãn tính đang điều trị ổn',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[7] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[7].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[7].text == '0' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[7] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[7].text == '1' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[7].text == '1' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 50,
                                          child: Text(
                                              '9. Tiền sử rối loạn đông máu/cầm máu hoặc đang dùng thuốc chống đông',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[8] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[8].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[8].text == '0' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[8] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[8].text == '1' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (temp.anamnesis[8].text == '1' )
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 50,
                                          child: Text(
                                              '10. Tiền sử dị ứng với các dị nguyên khác',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[9] = new TextEditingController(text:'1');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[9].text == '0' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color:
                                                (temp.anamnesis[9].text == '0' )
                                                    ? Colors.black
                                                    : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                temp.anamnesis[9] = new TextEditingController(text:'0');
                                              });
                                            },
                                            icon: Icon(
                                                (temp.anamnesis[9].text == '1' )
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color:
                                                (temp.anamnesis[9].text == '1' )
                                                    ? Colors.black
                                                    : Colors.blue,
                                          ),
                                        ))),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: RaisedButton(
                        onPressed: () {
                          setState(() async {
                            updateAnamnesis();
                          });
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
          )
        ]),
      ),
    );
  }
}
