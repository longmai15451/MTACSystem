import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mtacsystem/Components/DateRegister.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/controller/controllerData.dart';
import 'package:mtacsystem/controller/diseases_controller.dart';
import 'package:mtacsystem/controller/hospital_controller.dart';
import 'package:mtacsystem/controller/notify_helper.dart';
import 'package:mtacsystem/controller/vaccine_controller.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/diseases.dart';
import 'package:mtacsystem/models/hospital.dart';
import 'package:mtacsystem/models/vaccine.dart';
import 'dart:async';
import 'dart:convert';
import '../../Network/location_service.dart';
import '../../Components/mapScreen.dart';
import '../../main.dart';

class ChosseHospital extends StatefulWidget {
  final AccountProfile accountdata;
  const ChosseHospital({
    required this.accountdata,
  });
  @override
  State<ChosseHospital> createState() => _ChosseHospital();
}

class _ChosseHospital extends State<ChosseHospital> {

  VacRegister regisdata = new VacRegister();
  late bool check1;
  late bool check2;
  late Future<List<Vaccine>> vacData;
  late Future<List<Hospital>> hosData;
  late Future<List<Diseases>> diseaseData;
  late bool selectDisease;
  late bool selectMap;
  var notify;
  static int mindex=1;
  late List<bool> select = new List.filled(6, false ,growable:false);
  String? distance, duration;
  int durationSeconds = 2100;
 
  
  @override
  initState() {
    _getVaccineAndHos();
    notify = NotifyHelper();
    super.initState();
    selectDisease = false;
    selectMap = false;
  }

  void _getVaccineAndHos() async{
    hosData = HospitalController().fetchData();
    diseaseData = DiseaseController().fetchData();
    setState((){
       check1 = check2 = false;
       regisdata.registerDate.text = DateFormat("dd-MM-yyy").format(DateTime.now());
    });
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
    print(regisdata.endTime);
    var url="http://mtac1.000webhostapp.com/CAP1_mobile/vaccination_register.php";
    var response = await http.post(Uri.parse(url),body: {
      "id_card": widget.accountdata.idCard.toString(),
      "id_hos" : regisdata.idHos.toString(),
      "id_vac" : regisdata.idVac.toString(),
      "registerDate": regisdata.registerDate.text,
      "registerTime": regisdata.registerTime,
      "startTime": regisdata.startTime,
      "endTime": regisdata.endTime,
    });
    var data = json.decode(response.body);
    if(data != "Faild" && data != null){
      await notify.scheduledNotification(
        int.parse(data['registerDate'].toString().split("-")[1]),
        int.parse(data['registerDate'].toString().split("-")[2]),
        int.parse(data['registerTimed'].toString().split(":")[0]),
        int.parse(data['registerTimed'].toString().split(":")[1]),
        'Lịch hẹn tiêm vaccine',
        'bạn có lịch hẹn tiêm vaccine tại địa chỉ: ${data['address']}'       
      );
      toast('Đăng ký thành công', Colors.green);
      setState((){
        Get.offAll(MainScreen());
      });
    }
    else{
      toast('Đã có lỗi xảy ra. Vui lòng thử lại', Colors.red);
    }
  }

  timeSelected(int start, int end, List<bool> select, int index){
    return TextButton(
      onPressed: () { 
        setState((){
          select[index] = true;
          setSelect(index,select);
          regisdata.startTime = '$start:00:00';
          regisdata.endTime = '$end:00:00';
        });
        },
      child: Text('$start:00 - $end:00',style: TextStyle(fontSize: 14, color: Colors.black)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(select[index]?Colors.blue.shade300:Colors.blue.shade100),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        )
      ),
    );
  }

  Widget hospitalAlertDialogContainer(){
    return Container(
      height: 300,
      width: 300,
      child: FutureBuilder <List<Hospital>>(
            future: hosData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Hospital> data = snapshot.data!;
                return 
                ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      for(int i=0; i<data.length; ++i)
                      TextButton(
                        onPressed: () async {
                            index = i;
                            mindex=i;
                            var direction = await LocationService().getDirection(i+1);
                            setState((){
                              regisdata.hos.text = '${data[index].hosName}';
                              regisdata.idHos = data[i].idHos.toString();
                              distance = direction['distance'];
                              duration = direction['duration'];
                              _getSeconds(direction);
                              mindex=i;
                            });
                            Get.back(result: null);
                          },
                        child: ListTile(
                          title: Text('${data[i].hosName}'),
                          subtitle: Text('${data[i].hosAddress}'),
                        ),
                      ),
                    ],
                  );
                }
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
    );
  }


  Widget vaccineAlertDialogContainer(){
    return Container(
      height: 300,
      width: 300,
      child: FutureBuilder <List<Vaccine>>(
            future: vacData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Vaccine> data = snapshot.data!;
                return 
                ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      for(int i=0; i<data.length; ++i)
                      TextButton(
                        onPressed: () async {
                            index = i;
                            setState((){
                              regisdata.vac.text = '${data[i].vacName}';
                              regisdata.idVac= data[i].idVac.toString();
                              Get.back();
                            });
                          },
                        child: ListTile(
                          title: Text('${data[i].vacName}'),
                          subtitle: Column(
                            children: [
                              Text('Phù hợp với độ tuổi từ ${data[i].ageUseFrom} - ${data[i].ageUseTo}'),
                              Text('Thông tin vaccine : ${data[i].description}')
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
    );
  }


  Widget diseaseAlertDialogContainer(){
    return Container(
      height: 300,
      width: 300,
      child: FutureBuilder <List<Diseases>>(
            future: diseaseData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Diseases> data = snapshot.data!;
                return 
                ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      for(int i=0; i<data.length; ++i)
                      TextButton(
                        onPressed: () async {
                            index = i;
                            print(data[index].toJson());
                            vacData = VaccineController().fetchData(data[i].idDiseases.toString());
                            selectDisease = true;
                            setState((){
                              regisdata.des.text = '${data[i].diseaseName}';
                              Get.back();
                            });
                          },
                        child: ListTile(
                          title: Text('${data[i].diseaseName}'),
                        ),
                      ),
                    ],
                  );
                }
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
    );
  }


  void _getSeconds(Map<String, dynamic> direction) {
    durationSeconds = direction['duration_seconds'];
    durationSeconds<=300?durationSeconds += 420
    :durationSeconds<=900?durationSeconds += 600:durationSeconds = 2100;
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
              MapScreen(mapindex: mindex,height: 180, width: 345, ),
            Container(
              child: TextField(
                controller: regisdata.des,
                onTap:(){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Danh Sách bệnh'),
                        content: diseaseAlertDialogContainer(),
                      );
                    }
                  );
                },
                decoration: InputDecoration(
                    hintText: 'Chọn loại bệnh tiêm',
                    icon: Icon(Icons.sticky_note_2)),
              ),
            ),
            if(selectDisease == true)
              Container(
                child: TextField(
                  controller: regisdata.vac,
                  onTap:(){
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('Danh Sách Vaccine'),
                          content: vaccineAlertDialogContainer(),
                        );
                      }
                    );
                  },
                  decoration: InputDecoration(
                      hintText: 'Chọn loại vaccine',
                      icon: Icon(Icons.sticky_note_2)),
                ),
              ),
            Container(
              child: TextField(
                controller: regisdata.hos,
                onTap:(){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Danh Sách Bệnh Viện'),
                        content: hospitalAlertDialogContainer(),
                      );
                    }
                  );
                  setState((){

                  });
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
                    hintText: 'Chọn khung giờ có thể đến',
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
                      timeSelected(7,9,select,0),
                      SizedBox(width: 10),
                      timeSelected(9,11,select,1),
                      SizedBox(width: 10),
                      timeSelected(13,15,select,3),
                      SizedBox(width: 10),
                      timeSelected(15,17,select,4),
                      SizedBox(width: 10),
                      timeSelected(17,19,select,5),
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
                  if(regisdata.idHos!=null && regisdata.idVac!=null)
                    setState(() {
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
