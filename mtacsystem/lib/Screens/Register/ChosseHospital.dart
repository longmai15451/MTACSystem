import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtacsystem/Components/DateRegister.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/controllerData.dart';
import 'package:mtacsystem/Components/account.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class ChosseHospital extends StatefulWidget {
  final AccountProfile accountdata;
  const ChosseHospital({
    required this.accountdata,
  });
  @override
  State<ChosseHospital> createState() => _ChosseHospital(accountdata: accountdata);
}

class _ChosseHospital extends State<ChosseHospital> {
  final AccountProfile accountdata;
  _ChosseHospital({
    required this.accountdata,
  });
  VacRegister regisdata = new VacRegister();
  late bool check1;
  late bool check2;
  late List<bool> select = new List.filled(6, false ,growable:false);
  @override
  initState() {
    setState(() {
      check1 = check2 = false;
    });
    super.initState();
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

  Future signup() async {
    var url="http://mtac1.000webhostapp.com/CAP1_mobile/vaccination_register.php";
    var response = await http.post(Uri.parse(url),body: {
      "id_card": accountdata.idCard.toString(),
      "id_hos" : regisdata.idHos.text,
      "id_vac" : regisdata.idVac.text,
      "registerDate": regisdata.registerDate.text,
      "registerTime": regisdata.registerTime.text,
      "startTime": regisdata.startTime,
      "endTime": regisdata.endTime,
    });
    var data = json.decode(response.body);
    if(data == "Success"){
      toast('Thanh cong', Colors.green);
    }
    else{
      toast('Đã có lỗi xảy ra. Vui lòng thử lại', Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(child: Row(
          children: [
            Container(child: Text("Đặt lịch tiêm")),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.white,width:1.5),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Center(child: Text('1',style: TextStyle(fontSize: 13))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.white,width:1.5),
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Center(child: Text('2',style: TextStyle(fontSize: 13))),
              ),
            ),
          ],
        )),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Background(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              child: TextField(
                controller: regisdata.idVac,
                decoration: InputDecoration(
                    hintText: 'Chọn loại bệnh tiêm',
                    icon: Icon(Icons.sticky_note_2)),
              ),
            ),
            Container(
              child: TextField(
                controller: regisdata.idHos,
                decoration: InputDecoration(
                    hintText: 'Chọn bệnh viện', icon: Icon(Icons.local_hospital_sharp)),
              ),
            ),
            Container(
              child: DateRegister(),
            ),
            Container(
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Chọn giờ tiêm',
                    hintStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.timelapse)),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () { 
                          setState((){
                            select[0] = true;
                            setSelect(0,select);
                            regisdata.startTime = '07:00:00';
                            regisdata.endTime = '09:00:00';
                          });
                         },
                        child: Text('07:00 - 09:00',style: TextStyle(fontSize: 14, color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(select[0]?Colors.blue.shade300:Colors.blue.shade100),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          )
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () { 
                          setState((){
                            select[1] = true;
                            setSelect(1,select);
                            regisdata.startTime = '09:00:00';
                            regisdata.endTime = '11:00:00';
                          });
                         },
                        child: Text('09:00 - 11:00',style: TextStyle(fontSize: 14, color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(select[1]?Colors.blue.shade300:Colors.blue.shade100),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          )
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () { setState((){
                            select[3] = true;
                            setSelect(3,select);
                            regisdata.startTime = '13:00:00';
                            regisdata.endTime = '15:00:00';
                          }); },
                        child: Text('13:00 - 15:00',style: TextStyle(fontSize: 14, color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(select[3]?Colors.blue.shade300:Colors.blue.shade100),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          )
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () { setState((){
                            select[4] = true;
                            setSelect(4,select);
                            regisdata.startTime = '15:00:00';
                            regisdata.endTime = '17:00:00';
                          }); },
                        child: Text('15:00 - 17:00',style: TextStyle(fontSize: 14, color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(select[4]?Colors.blue.shade300:Colors.blue.shade100),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          )
                        ),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () { setState((){
                            select[5] = true;
                            setSelect(5,select);
                          }); },
                        child: Text('17:00 - 19:00',style: TextStyle(fontSize: 14, color: Colors.black)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(select[5]?Colors.blue.shade300:Colors.blue.shade100),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          )
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  );
                },
                )
            ),
            Container(
              child: new Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            check1 = false;
                          });
                        },
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            check1 = true;
                          });
                        },
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
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  setState(() async{
                    signup();
                    print(regisdata.startTime);
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
                      colors: [Colors.blue.shade600, Colors.blue.shade300],
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight
                    )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Đặt lịch tiêm",
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

void setSelect(int index, List<bool> select) {
  for(int i=0;i<select.length;++i){
    if(i==index) continue;
    select[i] = false;
  }
}
