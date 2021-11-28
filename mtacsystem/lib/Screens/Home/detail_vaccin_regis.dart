import 'package:flutter/material.dart';
import 'direction_model.dart';
import 'location_service.dart';
import 'mapScreen.dart';

class Detail extends StatefulWidget{
  final Direction info;

  const Detail({Key? key, required this.info}) : super(key: key);

  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MapScreen(info: widget.info),
          Container(
            height: 315,
            child: ListTile(
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Họ Tên: '),
                    Text('Số Điện Thoại: '),
                    Text('CCCD: '),
                    Text('Cơ sở y tế: '),
                    Text('Vaccine: '),
                    Text('Ngày Hẹn: '),
                    Text('Giờ Hẹn: '),
                    Text('Địa Chỉ Bệnh Viện: '),
                    Text('Địa chỉ: '),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        SizedBox(
                          width: 120,
                          child: TextButton(
                            onPressed: () async{ 
                              LocationService().getDirection('Millan', 'Paris');
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
