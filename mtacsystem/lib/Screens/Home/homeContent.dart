import 'dart:convert';
import 'package:mtacsystem/Screens/qrCode/qrCode_page.dart';
import 'package:mtacsystem/server/Server.dart' as sver;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Screens/Home/vaccine_his.dart';
import 'package:mtacsystem/Screens/Profile/editProf.dart';
import 'package:mtacsystem/Screens/Register/SignUpVaccin.dart';
import 'package:mtacsystem/Screens/Register/SignUpTest.dart';
import 'package:mtacsystem/models/account.dart';
import 'Chatbot/ChatMain.dart';
import 'covidstats.dart';
import 'vaccine_info.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class HomeContent extends StatefulWidget {
  final AccountProfile accountdata;
  final String adres;
  final bool locationc;
  HomeContent(
      {required this.accountdata,
      required this.adres,
      required this.locationc});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  var checking;

  @override
  initState() {
    getCheck();
    super.initState();
  }

  void getCheck() async {
    checking = await fetchVaccineData(widget.accountdata.idCard!);
  }

  Future fetchVaccineData(String idCard) async {
    String url = sver.serverip + '/CAP1_mobile/checkData.php';
    print(url);
    var response = await http.post(Uri.parse(url), body: {
      "idCard": idCard,
    });
    var json = jsonDecode(response.body);
    print(json);
    var result = {
      "vac": json['VacCheck'],
      "test": json['TestCheck'],
    };
    return result;
  }

  checkData() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      borderSide: BorderSide(color: Colors.red, width: 2),
      headerAnimationLoop: true,
      animType: AnimType.BOTTOMSLIDE,
      body: Column(
        children: [
          Text(
            'CẦN CẤP THÔNG TIN ĐỂ SỬ DỤNG!',
          ),
        ],
      ),
      btnOkColor: Colors.blue.shade600,
      btnCancelIcon: Icons.cancel,
      btnOkIcon: Icons.check_circle_outline,
      btnCancelText: '',
      btnOkText: '',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        setState(() async {
          await Get.to(() => EditProfile(
              accountdata: widget.accountdata, locationc: widget.locationc));
        });
      },
      buttonsTextStyle: TextStyle(fontSize: 13),
    )..show();
  }

  checkRegis() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      borderSide: BorderSide(color: Colors.red, width: 2),
      headerAnimationLoop: true,
      animType: AnimType.BOTTOMSLIDE,
      body: Column(
        children: [
          Text(
            'BẠN CÒN LỊCH HẸN CHƯA ĐƯỢC XỬ LÝ!',
          ),
        ],
      ),
      btnOkColor: Colors.blue.shade600,
      btnCancelIcon: Icons.cancel,
      btnCancelText: '',
      btnCancelOnPress: () {},
      buttonsTextStyle: TextStyle(fontSize: 13),
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 70.0,
          backgroundColor: Colors.teal,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () async {
              await Get.to(EditProfile(
                  accountdata: widget.accountdata,
                  locationc: widget.locationc));
              setState(() {});
            },
            icon: Icon(Icons.person),
            color: Colors.white,
            iconSize: 50.0,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Xin Chào,',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300)),
                  SizedBox(height: 5),
                  Text(widget.accountdata.fullName.toString(),
                      style: TextStyle(color: Colors.white))
                ],
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 5),
          color: Colors.teal,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/covid_background.jpg"),
                    fit: BoxFit.fill),
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                )),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              height: 100.0,
                              width: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.teal.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 16,
                                      offset: Offset(0, 0))
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.teal,
                                      Colors.tealAccent,
                                    ],
                                    begin: FractionalOffset.bottomLeft,
                                    end: FractionalOffset.topRight),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      onPressed: () {
                                        if (widget.accountdata.address == '' ||
                                            widget.accountdata.healthCard ==
                                                '' ||
                                            widget.accountdata.city == '')
                                          return checkData();
                                        print(checking['vac']);
                                        if (checking['vac'] != '0')
                                          return checkRegis();
                                        Get.to(SignUpVaccin(
                                            accountdata: widget.accountdata,
                                            address: widget.adres,
                                            locationc: widget.locationc));
                                      },
                                      child: Column(children: <Widget>[
                                        ImageIcon(
                                          AssetImage(
                                              'assets/images/vaccine.png'),
                                          size: 45.0,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(3.0),
                                          height: 50.0,
                                          width: 90.0,
                                          child: Text(
                                            'Đăng ký tiêm chủng',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.teal.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 16,
                                  offset: Offset(0, 0))
                            ],
                            gradient: LinearGradient(
                                colors: [Colors.teal, Colors.tealAccent],
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topRight),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 100.0,
                                width: 200.0,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  onPressed: () {
                                    Get.to(Dialogflow());
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      ImageIcon(
                                        AssetImage(
                                            'assets/images/google-docs.png'),
                                        size: 45.0,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 5.0),
                                        height: 50.0,
                                        width: 60.0,
                                        child: Text(
                                          'Tư vấn bệnh',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.teal.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 16,
                                  offset: Offset(0, 0))
                            ],
                            gradient: LinearGradient(
                                colors: [Colors.teal, Colors.tealAccent],
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topRight),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 100.0,
                                width: 200.0,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  onPressed: () {
                                    if (widget.accountdata.address == '' ||
                                        widget.accountdata.healthCard == '' ||
                                        widget.accountdata.city == '')
                                      return checkData();
                                    if (checking['test'] != '0')
                                      return checkRegis();
                                    Get.to(SignUpTest(
                                        accountdata: widget.accountdata,
                                        userlocation: widget.adres,
                                        locationc: widget.locationc));
                                  },
                                  child: Column(children: <Widget>[
                                    ImageIcon(
                                      AssetImage('assets/images/pcr-test.png'),
                                      size: 45.0,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      height: 50.0,
                                      width: 70.0,
                                      child: Text(
                                        'Đăng ký xét nghiệm',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.teal.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 16,
                                  offset: Offset(0, 0))
                            ],
                            gradient: LinearGradient(
                                colors: [Colors.teal, Colors.tealAccent],
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topRight),
                          ),
                          child: Container(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              onPressed: () {
                                Get.to(() => VaccineInfo());
                              },
                              child: Column(children: <Widget>[
                                ImageIcon(
                                  AssetImage('assets/images/safe.png'),
                                  size: 45.0,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  height: 50.0,
                                  width: 120.0,
                                  child: Text(
                                    'Thông tin vaccine',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                        Container(
                          height: 100.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.teal.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 16,
                                  offset: Offset(0, 0))
                            ],
                            gradient: LinearGradient(
                                colors: [Colors.teal, Colors.tealAccent],
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topRight),
                          ),
                          child: Container(
                            height: 100.0,
                            width: 200.0,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              onPressed: () {
                                // if (widget.accountdata.address == '' ||
                                //     widget.accountdata.healthCard == '' ||
                                //     widget.accountdata.city == '')
                                //   return checkData();
                                Get.to(QRCodePage(widget.accountdata));
                              },
                              child: Column(
                                children: <Widget>[
                                  ImageIcon(
                                    AssetImage('assets/images/qr-code.png'),
                                    size: 45.0,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    height: 50.0,
                                    width: 70.0,
                                    child: Text(
                                      'QR Code',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100.0,
                          width: 110.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.teal.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 16,
                                  offset: Offset(0, 0))
                            ],
                            gradient: LinearGradient(
                                colors: [Colors.teal, Colors.tealAccent],
                                begin: FractionalOffset.bottomLeft,
                                end: FractionalOffset.topRight),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  onPressed: () {
                                    Get.to(() => VaccineHis(
                                        idCard: widget.accountdata.idCard
                                            .toString()));
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      ImageIcon(
                                        AssetImage('assets/images/history.png'),
                                        size: 45.0,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 5),
                                        height: 50.0,
                                        width: 100.0,
                                        child: Text(
                                          'Lịch sử tiêm',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tình hình dịch bệnh',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 15),
                    CovidStats(),
                    SizedBox(height: 140),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
