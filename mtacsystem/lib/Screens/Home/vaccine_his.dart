import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Components/his_detail.dart';
import 'package:mtacsystem/Components/task_tile.dart';
import 'package:mtacsystem/controller/history_controller.dart';
import 'package:mtacsystem/models/schedule.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VaccineHis extends StatefulWidget {
  final String idCard;
  const VaccineHis({ Key? key, required this.idCard }) : super(key: key);

  @override
  _VaccineHisState createState() => _VaccineHisState();
}

class _VaccineHisState extends State<VaccineHis> {
  final _historyController = HistoryController();
  @override
  initState(){
    _getHistory();
    setState((){
    });
    super.initState();
  }

  _getHistory()async{
    _historyController.getSchedule(widget.idCard);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.blue.shade200,
        
        centerTitle: true,
        title: Text(
          'LỊCH SỬ TIÊM',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color(0xFFEEEEEE),
            fontFamily: "Roboto",
            fontSize: 30,
            ),
            textAlign: TextAlign.center,
        )
      ),
      body: Column(
      children: [
          SizedBox(height: 10),
          _showSchedule(),
        ],
      )
    );
  }

  Future<Map<String, dynamic>> search(String address)async{
    String url = 
    "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$address&key=AIzaSyBsZrS5LkAXAqzgVYMJQQMYOoWgYCHHZTU";
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var result = {
      'lat': json['results'][0]['geometry']['location']['lat'],
      'lng': json['results'][0]['geometry']['location']['lng'],
    };
    print(result['lat']);
    return result;
  }

  void getCordi(double lat, double lng, String address)async{
    
    
    setState((){

    });
  }



  _showSchedule(){
    return Expanded(
      child: Obx((){
        return ListView.builder(
          itemCount: _historyController.historyList.length,

          itemBuilder: (_, index){
            Schedule schedule = _historyController.historyList[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child:Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            double lat = 16.069203;
                            double lng = 108.193960;
                            var location = await search(schedule.address!);
                            lat = location['lat'];
                            lng = location['lng'];
                            Get.to(()=>HisDetail(schedule: schedule, lat: lat,lng: lng,));
                          },
                          child:TaskTile(schedule),
                        )
                      ]
                    )
                  )
                )
              );
          }
        );
      })
    );
  }
}