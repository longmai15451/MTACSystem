import 'dart:math';

import 'package:flutter/material.dart';
import '../../Network/location_service.dart';
import '../../Components/mapScreen.dart';
import '../../Network/sign_up_info.dart';

class Detail extends StatefulWidget{
  final String idCard;
  final String idVac;
  final String idHos;
  final String date;
  final String time;
  String? origin;
  String? destination;
  Detail({
    Key? key, required this.idCard, 
    required this.idVac, required this.idHos,
    required this.date, required this.time,
    this.origin, this.destination,
  }) : super(key: key);
  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {

  static int index = Random().nextInt(4);
  static var data;
  @override
  initState(){
    super.initState();
      _getData();
  }
  
  void _getData() async{
    data = await SignUpInfo().getRegisterData(widget.idCard,widget.idVac,widget.idHos,widget.date,widget.time);
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(child: MapScreen(height: 225, width: 345, mapindex:index )),
          SingleChildScrollView(
              child: ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('Họ Tên: ${data['full_name']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Số Điện Thoại:  ${data['phone']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('CCCD: ${data['id_card']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Cơ sở y tế:  ${data['hos_name']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Vaccine: ${data['vaccine']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Ngày Hẹn: ${data['register_date']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Giờ Hẹn: ${data['register_time']}'),
                        ],
                      ),
                      ListTile(
                          title: Text('Địa Chỉ Bệnh Viện:'),
                          subtitle: Text('${data['hos_address']}'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          SizedBox(
                            width: 120,
                            child: TextButton(
                              onPressed: () async{ 
                                LocationService().getDirection(index);
                                setState(() {
                                }); },
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
                              onPressed: () { setState((){
                                }); },
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
