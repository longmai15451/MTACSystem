import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Components/task_tile.dart';
import 'package:mtacsystem/controller/history_controller.dart';
import 'package:mtacsystem/models/schedule.dart';

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
    // final b = DateTime(2021,12,2);
    // final d = DateTime.now();
    // final dif = d.difference(b).inDays; //inHours /24.round()
    // print(dif);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.blue.shade100,
        
        centerTitle: true,
        title: Text(
          'LỊCH SỬ TIÊM',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color(0xFF002FFF),
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
                          onTap: (){
                            //Get.to(()=>Detail(schedule: schedule));
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