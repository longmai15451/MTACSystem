import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../Components/mapScreen.dart';
import '../../Network/sign_up_info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mtacsystem/server/Server.dart' as sver;
import '../../main.dart';

class Detail extends StatefulWidget{
  final String id;
  final String adres;
  final String type;
  final String des;
  final bool locationc;
  bool? res = false;
  Detail({
    Key? key, required this.id, required this.adres, required this.type, required this.des, this.res, required this.locationc,
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
    if(widget.type == '0')
      data = await SignUpInfo().getTestRegisterData(widget.id.toString());
    else
      data = await SignUpInfo().getVacRegisterData(widget.id.toString());
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
    if(widget.type == '0')
      url+='/CAP1_mobile/test_cancel.php';
    else
      url+='/CAP1_mobile/vac_cancel.php';
    var response = await http.post(Uri.parse(url),body: {
      "regisID" : widget.id.toString(),
    });
    var data = json.decode(response.body);
    if(data == 'Success'){
      toast('Đã hủy lịch!',Colors.green);
      Get.offAll(MainScreen(address: widget.adres,locationc: widget.locationc));
    }
    else
    {
      toast('Hệ thống đang gặp sự cố!',Colors.red);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () { 
          if(widget.res == true)
            Get.offAll(()=>MainScreen(address: widget.adres,locationc: widget.locationc));
          Get.back();
         },
      )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(child: MapScreen(height: 225, width: 345, origin: widget.adres, destination: widget.des,)),
          Expanded(
            child: SingleChildScrollView(
                
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: [
                            Text('Họ Tên: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?data['full_name']:""}'),
                            ),
                          ],
                        ),
                        
                        Row(
                          children: [
                            Text('Số Điện Thoại:  '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?data['phone']:""}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('CCCD: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?data['id_card']:""}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Cơ sở y tế:  '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?data['hos_name']:""}'),
                            ),
                          ],
                        ),
                        widget.type == '1'
                         ? Row(
                            children: [
                              Text('Tiêm phòng bệnh: '),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${data !=null ? data['disease']:""}'),
                              ),
                            ],
                          ) : 
                        Row(
                          children: [
                            Text('Ngày Hẹn: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?data['register_date']:""}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Giờ Hẹn: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?"${data['register_time'].toString().split(':')[0]}:${data['register_time'].toString().split(':')[1]}":""}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Tổng tiền cần thanh toán:  '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?data['price']:""}'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Trạng thái thanh toán:  '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${data!=null?data['status']:""}'),
                            ),
                          ],
                        ),
                        ListTile(
                            dense: false,
                            title: Text('Địa Chỉ Bệnh Viện:'),
                            subtitle: Text('${data!=null?data['hos_address']:""}'),
                        ),
                       
                      ]
                    
                  ),
                ),
              ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 56,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 160,
                            child: TextButton(
                              onPressed: () async{ 
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.NO_HEADER,
                                    borderSide: BorderSide(color: Colors.teal, width: 2),
                                    headerAnimationLoop: false,
                                    animType: AnimType.SCALE,
                                    body: Column(
                                      children: [
                                        Text('BẠN CÓ MUỐN HỦY LỊCH!',),
                                      ],
                                    ),
                                    btnOkColor: Colors.teal,
                                    btnCancelIcon: Icons.cancel,
                                    btnOkIcon: Icons.check_circle_outline,
                                    btnCancelText: '',
                                    btnOkText: '',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () async {
                                      await cancelSchedule();
                                    },
                                  )..show();
                               },
                              child: Text('Hủy',style: TextStyle(fontSize: 24, color: Colors.black)),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(Colors.red),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: BorderSide(color: Colors.red, width: 2.5)
                                  )
                                )
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: 160,
                            child: TextButton(
                              onPressed: () {
                                if(data!=null)
                                  MapsLauncher.launchQuery(
                                    '${data['hos_address']}');
                              },
                              child: Text('ĐIỀU HƯỚNG',style: TextStyle(fontSize: 24, color: Colors.black)),
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(Colors.tealAccent),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: BorderSide(color: Colors.blue)
                                  )
                                )
                              ),
                            ),
                          ),
          ]
        )
      ),
    );
  }
}
