import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Register/SignUpVaccin.dart';
import 'package:mtacsystem/Screens/Register/SignUpTest.dart';
import 'package:mtacsystem/DeclarationH/DeclarationH.dart';
import 'package:mtacsystem/Chatbot/ChatMain.dart';
import 'covidstats.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0),
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
            top: Radius.circular(60.0),
          )
        ),
      child: Container(
        padding: EdgeInsets.only(top: 25),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20.0,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpVaccin()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeclarationH()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpTest()));
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
                        onPressed: () {
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Dialogflow()));
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
            height: 70.0,
            padding: EdgeInsets.only(top: 30, right: 190,),
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
            height: 15.0,
          ),
          Container(
            height: 15.0,
          ),
        ],
    ),
      ),
      ),
    );
  }
}
