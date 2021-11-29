import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mtacsystem/Components/DateRegister.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Components/controllerData.dart';
import 'package:mtacsystem/Components/account.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../../Network/location_service.dart';
import '../../Components/mapScreen.dart';

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
  String? distance, duration;
  int durationSeconds = 1800;
  @override
  initState() {
    setState(() {
      check1 = check2 = false;
    });
    super.initState();
  }

  void _getControllerText(String text){
    setState((){
      regisdata.registerDate.text = text;
    });
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
     print(accountdata.idCard.toString());
      print(regisdata.idHos.text);
       print(regisdata.idVac.text);
        print(regisdata.registerDate.text);
         print(regisdata.registerTime);
          print(regisdata.startTime);
    print(regisdata.endTime);
    var url="http://mtac1.000webhostapp.com/CAP1_mobile/vaccination_register.php";
    var response = await http.post(Uri.parse(url),body: {
      "id_card": accountdata.idCard.toString(),
      "id_hos" : regisdata.idHos.text,
      "id_vac" : regisdata.idVac.text,
      "registerDate": regisdata.registerDate.text,
      "registerTime": regisdata.registerTime,
      "startTime": regisdata.startTime,
      "endTime": regisdata.endTime,
    });
    var data = json.decode(response.body);
    if(data == "Success"){
      toast('Đăng ký thành công', Colors.green);
    }
    else{
      toast('Đã có lỗi xảy ra. Vui lòng thử lại', Colors.red);
    }
  }

  Widget customAlertDialogContainer(){
    return Container(
      height: 300,
      width: 300,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: [
              for(int i=0; i<19; ++i)
              TextButton(
                  onPressed: () async { 
                      var direction = await LocationService().getDirection('46 Xuân Đán 1, Thanh Khê, Đà Nẵng', '404 Trần Cao Vân, Đà Nẵng');
                      setState((){
                        regisdata.idHos.text = '$i';
                        distance = direction['distance'];
                        duration = direction['duration'];
                        _getSeconds(direction);
                        Navigator.pop(context);
                      });
                    },
                  child: ListTile(
                    title: Text('Hey there $i'),
                    subtitle: Text('Hi there $i'),
                  ),
                ),
              
            ],
          );
        }
      )
    );
  }

  void _getSeconds(Map<String, dynamic> direction) {
    durationSeconds = direction['duration_seconds'];
    durationSeconds<=300?durationSeconds += 420
    :durationSeconds<=900?durationSeconds += 600:durationSeconds = 1800;
    var today = DateTime.now();
    var estimate = today.add(Duration(seconds: durationSeconds));
    var timeFormat = DateFormat('Hms');
    regisdata.registerTime = timeFormat.format(estimate);
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
            MapScreen(height: 180, width: 345, distance: distance, duration: duration),
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
                onTap:(){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Danh Sách Bệnh Viện'),
                        content: customAlertDialogContainer(),
                      );
                    }
                  );
                },
                decoration: InputDecoration(
                    hintText: 'Chọn bệnh viện', icon: Icon(Icons.local_hospital_sharp)),
              ),
            ),
            Container(
              child: DateRegister(getControllerText: _getControllerText),
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
                            regisdata.startTime = '15:00:00';
                            regisdata.endTime = '17:00:00';
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
