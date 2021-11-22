import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';

class ChosseHospital extends StatefulWidget {
  @override
  State<ChosseHospital> createState() => _ChosseHospital();
}

class _ChosseHospital extends State<ChosseHospital> {
  late bool check1;
  late bool check2;

  @override
  initState() {
    setState(() {
      check1 = check2 = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt lịch tiêm"),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Background(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Chọn loại bệnh tiêm',
                    icon: Icon(Icons.sticky_note_2)),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Chọn bệnh viện', icon: Icon(Icons.local_hospital_sharp)),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Chọn ngày tiêm',
                    icon: Icon(Icons.date_range)),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Chọn giờ tiêm',
                    icon: Icon(Icons.timelapse)),
              ),
            ),
            Container(
              child: new Row(
                children: [
                  RaisedButton(
                      onPressed: () {
                        setState(() {
                          check1 = false;
                        });
                      },
                      highlightColor: Colors.transparent,
                      color: Colors.white,
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
                              color: check1 ? Colors.black : Colors.blue,
                            ),
                            Text('  Thanh toán online'),
                          ],
                        ),
                      )),
                  RaisedButton(
                      onPressed: () {
                        setState(() {
                          check1 = true;
                        });
                      },
                      highlightColor: Colors.transparent,
                      color: Colors.white,
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
                              color: !check1 ? Colors.black : Colors.blue,
                            ),
                            Text('  Thanh toán tại bệnh viện'),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: RaisedButton(
                onPressed: () {},
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
                      colors: [Colors.blue.shade600, Colors.blue.shade300],
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight
                    )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Đặt tiêm",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                )
              ),
            ),

          ]
        )
      ),
    );
  }
}