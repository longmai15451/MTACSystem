
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Screens/Profile/editProf.dart';
import 'package:mtacsystem/Screens/Register/SignUpVaccin.dart';
import 'package:mtacsystem/Screens/Register/SignUpTest.dart';
import 'package:mtacsystem/controller/notify_helper.dart';
import 'package:mtacsystem/models/account.dart';
import 'Chatbot/ChatMain.dart';
import 'covidstats.dart';


class HomeContent extends StatefulWidget {
  final AccountProfile accountdata;
  HomeContent({required this.accountdata});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  NotifyHelper notifyHelper = NotifyHelper();

   @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      toolbarHeight: 80.0,
      backgroundColor: Colors.blue.shade200,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () async {
          await Get.to(EditProfile(accountdata: widget.accountdata,));
        },
        icon: Icon(Icons.person),
        color: Colors.black,
        iconSize: 50.0,
      ),
      title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Xin Chào,', 
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300
                )),
              Text(widget.accountdata.fullName.toString(), 
              style: TextStyle(color: Colors.black))
            ],
          ),
        ],
      ),
    ),
    body: ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 3.0),
          color: Colors.blue.shade200,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0,1.0),
                  blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50.0),
              )
            ),
          child: Container(
            padding: EdgeInsets.only(top: 1),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 15.0,
              ),
              
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
                                color: Colors.blue.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset: Offset(0, 2))
                          ],
                          gradient: LinearGradient(
                              colors: [Colors.blue.shade400, Colors.blue.shade200],
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
                                  Get.to(SignUpVaccin(accountdata: widget.accountdata,));
                                },
                                child: Column(
                                  children: <Widget>[
                                    ImageIcon(
                                      AssetImage('assets/images/vaccine.png'),
                                      size: 50.0,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      height: 50.0,
                                      width: 90.0,
                                      child: Text(
                                        'Đăng ký tiêm chủng',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ]
                                ),
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
                            color: Colors.blue.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade200],
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
                            },
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('assets/images/google-docs.png'),
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  height: 50.0,
                                  width: 60.0,
                                  child: Text(
                                    'Khai báo y tế',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
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
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade200],
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
                              Get.to(SignUpTest(accountdata: widget.accountdata,));
                            },
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('assets/images/pcr-test.png'),
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  height: 50.0,
                                  width: 70.0,
                                  child: Text(
                                    'Đăng ký xét nghiệm',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ]
                            ),
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
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade200],
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
                            onPressed: () async{
                              
                            },
                            child: Column(
                              children: <Widget>[
                                  ImageIcon(
                                  AssetImage('assets/images/safe.png'),
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  height: 50.0,
                                  width: 120.0,
                                  child: Text(
                                    'Chứng nhận ngừa Covid',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ) 
                              ]
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
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade200],
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
                                  AssetImage('assets/images/qr-code.png'),
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  height: 50.0,
                                  width: 50.0,
                                  child: Text(
                                    'Mã số điện tử',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
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
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 2))
                      ],
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade200],
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
                              
                            },
                            child: Column(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('assets/images/history.png'),
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  height: 50.0,
                                  width: 100.0,
                                  child: Text(
                                    'Lịch sử tiêm',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
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
              Container(
                height: 40.0,
                padding: EdgeInsets.only(top: 15, right: 190,),
                child: Text(
                  'Tình hình dịch bệnh',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                )
              ),
              CovidStats(),
              Container(
                height: 16.0,
              ),
            ],
        ),
          ),
          ),
        ),
      ],
    )
    );
  }
  
}
