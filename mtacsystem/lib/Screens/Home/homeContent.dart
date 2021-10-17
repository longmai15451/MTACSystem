import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Register/SignUpVaccin.dart';

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpVaccin()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Icon(
                      Icons.person_add,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  height: 50.0,
                  width: 80.0,
                  child: Text(
                    'Đăng ký tiêm chủng',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Icon(
                      Icons.smartphone_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  height: 50.0,
                  width: 70.0,
                  child: Text(
                    'Khai báo y tế',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Icon(
                      Icons.local_hospital_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  height: 50.0,
                  width: 80.0,
                  child: Text(
                    'Đăng ký xét nghiệm',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Icon(
                      Icons.insert_drive_file_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  height: 50.0,
                  width: 90.0,
                  child: Text(
                    'Chứng nhận tiêm chủng',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Icon(
                      Icons.qr_code_2_sharp,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  height: 50.0,
                  width: 70.0,
                  child: Text(
                    'Mã số điện tử',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  height: 50.0,
                  width: 60.0,
                  child: Text(
                    'Lịch sử tiêm',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}