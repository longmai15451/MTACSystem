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
  final String userlocation;
  final bool locationc;
  const SignUpTest({
    required this.accountdata,
    required this.userlocation,
    required this.locationc,
  });
  @override
  State<SignUpTest> createState() => _SignUpTest();
}

class _SignUpTest extends State<SignUpTest> {
  late bool check1;
  TempUserProfile temp = new TempUserProfile();
  late bool _readonly = true;
  bool _expanded = false;
  final format = DateFormat("dd-MM-yyy");
  bool isLoading = false;
  @override
  initState() {
    temp.birthdate.text = widget.accountdata.birthDate.toString();
    temp.gender.text = widget.accountdata.gender.toString();
    setState(() {
      check1 = false;
    });
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
            child: Row(
          children: [
            
            Container(child: Text("ĐĂNG KÝ XÉT NGHIỆM")),
            SizedBox(width: 25),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.3),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Center(child: Text('1', style: TextStyle(fontSize: 13))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.3),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
            ),
          ],
        )),
      ),
      body: Container(
        color: Colors.teal.shade50,
        child: Background(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 380,
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 10),
                  child: Text(
                    "Thông tin đăng ký xét nghiệm",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 22,
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
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ExpansionPanelList(
              elevation: 0,
              animationDuration: Duration(milliseconds: 1000),
              children: [
                ExpansionPanel(
                  isExpanded: _expanded,
                  canTapOnHeader: true,
                  backgroundColor: Colors.teal.shade50,
                  headerBuilder: (context, isExpanded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                Text(widget.accountdata.fullName.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    'Năm sinh: ' +
                                        widget.accountdata.birthDate.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    'Giới Tính: ' +
                                        (widget.accountdata.gender == 'male'
                                            ? 'Nam'
                                            : 'Nữ'),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    'SĐT: ' +
                                        widget.accountdata.phone.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    'CCCD: ' +
                                        widget.accountdata.idCard.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                    'Thẻ BHYT: ' +
                                        widget.accountdata.healthCard
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ]),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 17.0),
                          child: Text(
                            'Địa chỉ: ' + widget.userlocation,
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          controller: temp.name = new TextEditingController(
                              text: widget.accountdata.fullName),
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
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.red)
                                // ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 21, vertical: 5),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextField(
                          controller: temp.phone = new TextEditingController(
                              text: widget.accountdata.phone),
                          readOnly: _readonly,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 15),
                          // initialValue: 'Input text',
                          decoration: InputDecoration(
                            hintText: 'Số điện thoại',
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: temp.idcard = new TextEditingController(
                              text: widget.accountdata.idCard),
                          readOnly: _readonly,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 15),
                          // initialValue: 'Input text',
                          decoration: InputDecoration(
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: temp.healthCard =
                              new TextEditingController(
                                  text: widget.accountdata.healthCard),
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
                              )),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: temp.job = new TextEditingController(
                              text: widget.accountdata.job),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: temp.city = new TextEditingController(
                              text: widget.accountdata.city),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: temp.district = new TextEditingController(
                              text: widget.accountdata.district),
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
                              )),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: temp.ward = new TextEditingController(
                              text: widget.accountdata.ward),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: temp.address = new TextEditingController(
                              text: widget.accountdata.address),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: temp.nation = new TextEditingController(
                              text: widget.accountdata.nation),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextFormField(
                          controller: temp.country = new TextEditingController(
                              text: widget.accountdata.country),
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
              dividerColor: Colors.grey,
              expansionCallback: (panelIndex, isExpanded) {
                _expanded = !_expanded;
                setState(() {});
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Lựa chọn loại xét nghiệm ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        new Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 0, left: 10.0),
                                        child: RaisedButton(
                                            onPressed: () {
                                              setState(() {
                                                check1 = false;
                                              });
                                            },
                                            highlightColor: Colors.transparent,
                                            color: Colors.teal.shade50,
                                            elevation: 0.0,
                                            splashColor: Colors.transparent,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    check1
                                                        ? Icons.radio_button_off
                                                        : Icons.radio_button_on,
                                                    size: 20,
                                                    color: check1
                                                        ? Colors.teal
                                                        : Colors.teal,
                                                  ),
                                                  Text('  Test nhanh'),
                                                ],
                                              ),
                                            )),
                                      ),
                                      RaisedButton(
                                          onPressed: () {
                                            setState(() {
                                              check1 = true;
                                            });
                                          },
                                          highlightColor: Colors.transparent,
                                          color: Colors.teal.shade50,
                                          elevation: 0.0,
                                          splashColor: Colors.transparent,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  !check1
                                                      ? Icons.radio_button_off
                                                      : Icons.radio_button_on,
                                                  size: 20,
                                                  color: !check1
                                                      ? Colors.teal
                                                      : Colors.teal,
                                                ),
                                                Text('  PCR'),
                                              ],
                                            ),
                                          )),
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
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 25, right: 25),
                    side: BorderSide(color: Colors.teal, width: 1.0)),
                onPressed: () async {
                  if (isLoading) return;
                  setState(() => isLoading = true);
                  await Get.to(ChooseTest(
                      accountdata: widget.accountdata,
                      userlocation: widget.userlocation,
                      locationc: widget.locationc));
                  setState(() => isLoading = false);
                },
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
        )),
      ),
    );
  }
}
