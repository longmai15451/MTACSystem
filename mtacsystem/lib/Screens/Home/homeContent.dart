import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Screens/Register/SignUpVaccin.dart';
import 'package:mtacsystem/DeclarationH/DeclarationH.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 2))
                    ],
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.blue.shade400],
                        begin: FractionalOffset.bottomLeft,
                        end: FractionalOffset.topRight),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: FlatButton(
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
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 2))
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.shade400],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 200.0,
                    child: FlatButton(
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
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2))
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.shade400],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 200.0,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpVaccin()));
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
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2))
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.shade400],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpVaccin()));
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
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2))
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.shade400],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 200.0,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpVaccin()));
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
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2))
                ],
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.shade400],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpVaccin()));
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
          height: 15.0,
        ),
        // Row(
        //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //    children: <Widget>[
        //      Container(
        //       height: 150.0,
        //       width: 355.0,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10.0),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(0.3),
        //             spreadRadius: 3,
        //             blurRadius: 3,
        //             offset: Offset(0, 2))
        //         ],
        //         gradient: LinearGradient(
        //             colors: [Colors.white, Colors.grey.shade100],
        //             begin: FractionalOffset.bottomLeft,
        //             end: FractionalOffset.topRight
        //         ),
        //       ),
        //       child: Column(
        //         children: <Widget>[
        //           Container(
                    
        //           ),
        //         ],
        //       ),
        //     ),
        //    ]
        // ),
      ],
    );
  }
}
