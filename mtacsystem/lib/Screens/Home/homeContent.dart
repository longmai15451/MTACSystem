import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Screens/Register/SignUpVaccin.dart';

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
                          child: ImageIcon(
                            AssetImage('assets/images/vaccine.png'),
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ),
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
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      )
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
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpVaccin()));
                      },
                      child: ImageIcon(
                        AssetImage('assets/images/google-docs.png'),
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: 90.0,
                    child: Text(
                      'Khai báo y tế',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
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
                      child: ImageIcon(
                        AssetImage('assets/images/pcr-test.png'),
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: 90.0,
                    child: Text(
                      'Đăng ký xét nghiệm',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
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
                      child: ImageIcon(
                        AssetImage('assets/images/safe.png'),
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: 100.0,
                    child: Text(
                      'Chứng nhận ngừa Covid',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
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
                      child: ImageIcon(
                        AssetImage('assets/images/qr-code.png'),
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    height: 50.0,
                    width: 100.0,
                    child: Text(
                      'Mã số điện tử',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
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
                      child: ImageIcon(
                        AssetImage('assets/images/history.png'),
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
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
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 15.0,
        ),
        
        Stack( //Covid Tracked
          children: <Widget>[
            Container(
              height: 150.0,
              width: 355.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2))
                ],
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey.shade100],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight
                ),
              ),
            ),
            
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
              height: 140.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: [Colors.red.shade100, Colors.red.shade200],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 2))
                ],
              ),
              child: Column(
                children: <Widget>[
                  ImageIcon(
                    AssetImage('assets/images/infected.png'),
                        size: 50.0,
                        color: Colors.red[900],
                  ),
                  Container(
                    // margin: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      '800.100',
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25.0),
                    height: 60,
                    width: 150,
                    child: Text(
                      'Số ca nhiễm',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: 140.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Colors.green.shade200, Colors.green.shade300],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 2))
                  ],
                ),
                child: Column(
                children: <Widget>[
                  ImageIcon(
                    AssetImage('assets/images/recovered.png'),
                        size: 50.0,
                        color: Colors.green[900],
                  ),
                  Container(
                    // margin: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      '800.100',
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25.0),
                    height: 60,
                    width: 150,
                    child: Text(
                      'Số ca nhiễm',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
              ),
            ),
            Positioned(
              top: 0,
              left: 125,
              child: Container(
                margin: EdgeInsets.fromLTRB(2.5, 5, 5, 5),
                height: 140.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Colors.black26, Colors.black38],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 2))
                  ],
                ),
                child: Column(
                children: <Widget>[
                  ImageIcon(
                    AssetImage('assets/images/death.png'),
                        size: 50.0,
                        color: Colors.black87,
                  ),
                  Container(
                    // margin: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      '800.100',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25.0),
                    height: 60,
                    width: 150,
                    child: Text(
                      'Số ca nhiễm',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
              ),
            ),
          ],
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
