import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mtacsystem/models/schedule.dart';
import '../../Components/mapScreen.dart';
import '../../Network/sign_up_info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mtacsystem/server/Server.dart' as sver;

import '../../main.dart';

class Detail extends StatefulWidget{
  final Schedule schedule;
  final String adres;
  Detail({
    Key? key, required this.schedule, required this.adres,
  }) : super(key: key);
  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  static var data;
  @override
  initState(){
    _getData();
    super.initState();
  }
  
  void _getData() async{
    if(widget.schedule.type == '0')
      data = await SignUpInfo().getTestRegisterData(widget.schedule.regisID.toString());
    else
      data = await SignUpInfo().getVacRegisterData(widget.schedule.regisID.toString());
    setState(() {
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

  Future cancelSchedule()async{
    var url=sver.serverip;
    if(widget.schedule.type == '0')
      url+='/CAP1_mobile/test_cancel.php';
    else
      url+='/CAP1_mobile/vac_cancel.php';
    var response = await http.post(Uri.parse(url),body: {
      "regisID" : widget.schedule.regisID.toString(),
    });
    var data = json.decode(response.body);
    if(data == 'Success'){
      toast('Đã hủy lịch!',Colors.green);
      Get.offAll(MainScreen(address: widget.adres,));
    }
    else
    {
      toast('Hệ thống đang gặp sự cố!',Colors.red);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(child: MapScreen(height: 225, width: 345, origin: widget.adres, destination: widget.schedule.address!,)),
          SingleChildScrollView(
              child: ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('Họ Tên: ${data!=null?data['full_name']:""}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Số Điện Thoại:  ${data!=null?data['phone']:""}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('CCCD: ${data!=null?data['id_card']:""}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Cơ sở y tế:  ${data!=null?data['hos_name']:""}'),
                        ],
                      ),
                      if(widget.schedule.type == '1')
                        Row(
                          children: [
                            Text('Tiêm phòng bệnh: ${data!=null?data['vaccine']:""}'),
                          ],
                        ),
                      Row(
                        children: [
                          Text('Ngày Hẹn: ${data!=null?data['register_date']:""}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Giờ Hẹn: ${data!=null?data['register_time']:""}'),
                        ],
                      ),
                      ListTile(
                          title: Text('Địa Chỉ Bệnh Viện:'),
                          subtitle: Text('${data!=null?data['hos_address']:""}'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          SizedBox(
                            width: 120,
                            child: TextButton(
                              onPressed: () async{ 
                                  await cancelSchedule();
                               },
                              child: Text('Hủy',style: TextStyle(fontSize: 14, color: Colors.black)),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                )
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: 120,
                            child: TextButton(
                              onPressed: () {
                                if(data!=null)
                                  MapsLauncher.launchQuery(
                                    '${data['hos_address']}');
                              },
                              child: Text('Dẫn đường',style: TextStyle(fontSize: 14, color: Colors.black)),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade100),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]
                  
                ),
              ),
            ),
        ],
      ),
    );
  }
}
