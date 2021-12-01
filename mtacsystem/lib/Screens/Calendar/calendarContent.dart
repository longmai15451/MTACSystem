import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:mtacsystem/Components/task_tile.dart';
import 'package:mtacsystem/controller/notify_helper.dart';
import 'package:mtacsystem/controller/schedule_controller.dart';
import 'package:mtacsystem/models/schedule.dart';

class CalendarContent extends StatefulWidget{
  
  @override
  State<CalendarContent> createState() => _CalendarContentState();
}

class _CalendarContentState extends State<CalendarContent> {
  final _scheduleController = Get.put(ScheduleController());
  static DateTime _selectDate = DateTime.now();

  var notifyHelper;

  @override
  initState(){
    super.initState();
    notifyHelper = NotifyHelper();
    _getSchedule();
    notifyHelper.scheduledNotification();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        backgroundColor: Colors.blue.shade100,
        iconTheme: IconThemeData(
          color:Colors.blue.shade100,
        ),
        centerTitle: true,
        title: Text(
          'LỊCH HẸN',
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
          _dateBar(),
          SizedBox(height: 10),
          _showSchedule(),
          
        ],
      )
    );
  }

  _getSchedule()async{
    _scheduleController.getSchedule();
    setState((){

    });
  }


  _showSchedule(){
    return Expanded(
      child: Obx((){
        return ListView.builder(
          itemCount: _scheduleController.scheduleList.length,

          itemBuilder: (_, index){

            Schedule schedule = _scheduleController.scheduleList[index];
            print(schedule.note);
            if(schedule.registerDate == DateFormat('yyyy-MM-dd').format(_selectDate) ) {
              // notifyHelper.scheduledNotification(
              //   int.parse(schedule.registerTime.toString().split(":")[0]),
              //   int.parse(schedule.registerTime.toString().split(":")[1]),
              //   schedule
              // );
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child:Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){

                            });
                          },
                          child:TaskTile(schedule),
                        )
                      ]
                    )
                  )
                )
              );
            }
            else{
              return Container();
            }
          }
        );
      })
    );
  }

  _dateBar() {
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          dateTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          dayTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          monthTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          onDateChange: (date){
            setState((){
              _selectDate=date;
            });
          },
        ),
      );
  }
}