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
  final String address;
  final bool locationc;
  SignUpVaccin({
    required this.accountdata,
    required this.address,
    required this.locationc,
  });
  @override
  State<SignUpVaccin> createState() =>
      _SignUpVaccinState(accountdata: accountdata);
}

class _SignUpVaccinState extends State<SignUpVaccin> {
  TempUserProfile temp = new TempUserProfile();
  late bool _readonly = true;
  late AccountProfile accountdata;
  bool _expanded = false;
  bool isLoading = false;
  final format = DateFormat("dd-MM-yyy");
  _SignUpVaccinState({required this.accountdata});
  @override
  initState() {
    _getControllerText(accountdata.birthDate.toString());
    getGenderController(accountdata.gender.toString());
    super.initState();
  }

  void _getControllerText(String text) {
    setState(() {
      temp.birthdate.text = text;
    });
  }

  void getGenderController(String value) {
    setState(() {
      temp.gender.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: SizedBox(
            child: Row(
          children: [
            SizedBox(width: 15),
            Container(child: Text("ĐĂNG KÝ TIÊM CHỦNG")),
            SizedBox(width: 28),
            // Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   child: Container(
            //     width: 20,
            //     height: 20,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white, width: 1.3),
            //       borderRadius: BorderRadius.all(Radius.circular(100.0)),
            //     ),
            //     child: Center(child: Text('1', style: TextStyle(fontSize: 13))),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   child: Container(
            //     width: 20,
            //     height: 20,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white, width: 1.3),
            //       borderRadius: BorderRadius.all(Radius.circular(100.0)),
            //     ),
            //   ),
            // ),
          ],
        )),
      ),
      body: Container(
        color: Colors.teal.shade50,
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
                child: Text(
                  "Thông tin đăng ký tiêm",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Vui lòng kiểm tra thông tin trước khi đăng ký.',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
                textAlign: TextAlign.center,
              ),
              ExpansionPanelList(
                elevation: 0,
                animationDuration: Duration(milliseconds: 1000),
                children: [
                  ExpansionPanel(
                    isExpanded: _expanded,
                    //canTapOnHeader: true,
                    canTapOnHeader: true,
                    backgroundColor: Colors.teal.shade50,
                    headerBuilder: (context, isExpanded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          ListTile(
                            title: Text(
                              'Thông tin người dùng',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            //trailing: Text(_expanded ? 'Chi tiết' : 'Ẩn bớt'),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 10),
                                  Text(
                                    accountdata.fullName.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                      'Năm sinh: ' +
                                          accountdata.birthDate.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SizedBox(height: 10),
                                  Text(
                                    'Giới Tính: ' +
                                        (accountdata.gender == 'male'
                                            ? 'Nam'
                                            : 'Nữ'),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text('SĐT: ' + accountdata.phone.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SizedBox(height: 10),
                                  Text(
                                    'CCCD: ' + accountdata.idCard.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Thẻ BHYT: ' +
                                        accountdata.healthCard.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Text(
                              'Địa chỉ: ' + widget.address.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            controller: temp.name = new TextEditingController(
                                text: accountdata.fullName),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Họ và tên',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
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
                              margin: EdgeInsets.only(left: 140, top: 10),
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
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: dateTimePicker(
                                      getControllerText: _getControllerText,
                                      readOnly: _readonly),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 5),
                                  child: Gender(
                                      accountgender: temp.gender.text,
                                      getGenderController: getGenderController,
                                      readOnly: _readonly),
                                ),
                              ],
                            ),
                          ],
                        ), //Ngày Sinh Giới Tính
                        Container(
                          alignment: Alignment.center,
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
                                horizontal: 20, vertical: 10),
                            child: TextField(
                              controller: temp.phone =
                                  new TextEditingController(
                                      text: accountdata.phone),
                              readOnly: _readonly,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 15),
                              // initialValue: 'Input text',
                              decoration: InputDecoration(
                                hintText: 'Số điện thoại',
                                // errorText: 'Error message', ------ báo lỗi k nhập
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.teal, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )),
                        Container(
                          alignment: Alignment.center,
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.idcard = new TextEditingController(
                                text: accountdata.idCard),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              //labelText: 'Số CMND',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.healthCard =
                                new TextEditingController(
                                    text: accountdata.healthCard),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Số thẻ bảo hiểm y tế',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.job = new TextEditingController(
                                text: accountdata.job),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              // labelText: 'Nghề nghiệp',
                              hintText: 'Nghề nghiệp',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.city = new TextEditingController(
                                text: accountdata.city),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Tỉnh/Thành phố',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.district =
                                new TextEditingController(
                                    text: accountdata.district),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Quận/Huyện',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.ward = new TextEditingController(
                                text: accountdata.ward),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Phường/Xã',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.address =
                                new TextEditingController(
                                    text: accountdata.address),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Nhập nội dung',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.nation = new TextEditingController(
                                text: accountdata.nation),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Dân tộc',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: temp.country =
                                new TextEditingController(
                                    text: accountdata.country),
                            readOnly: _readonly,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 15),
                            // initialValue: 'Input text',
                            decoration: InputDecoration(
                              hintText: 'Quốc tịch',
                              // errorText: 'Error message', ------ báo lỗi k nhập
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                dividerColor: Colors.teal,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (isLoading) return;
                    setState(() => isLoading = true);
                    await Get.to(ChosseHospital(
                        accountdata: accountdata,
                        userlocation: widget.address,
                        locationc: widget.locationc));
                    setState(() => isLoading = false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 25, right: 25),
                      side: BorderSide(color: Colors.teal, width: 1.0)),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Tiếp tục",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
