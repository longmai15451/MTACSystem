import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:mtacsystem/Components/task_tile.dart';
import 'package:mtacsystem/controller/schedule_controller.dart';
import 'package:mtacsystem/models/schedule.dart';
import 'detail_vaccin_regis.dart';

class CalendarContent extends StatefulWidget {
  final String idCard;
  final String adres;
  final bool locationc;
  const CalendarContent(
      {Key? key,
      required this.idCard,
      required this.adres,
      required this.locationc})
      : super(key: key);
  @override
  State<CalendarContent> createState() => _CalendarContentState();
}

class _CalendarContentState extends State<CalendarContent> {
  static DateTime _selectDate = DateTime.now();
  final _scheduleController = ScheduleController();
  @override
  initState() {
    _selectDate = DateTime.now();
    _getSchedule();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80.0,
            backgroundColor: Colors.teal,
            iconTheme: IconThemeData(
              color: Colors.teal,
            ),
            centerTitle: true,
            title: Text(
              'LỊCH HẸN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            )),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/covid_background.jpg"),
                fit: BoxFit.fill),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _dateBar(),
              SizedBox(height: 10),
              _showSchedule(),
            ],
          ),
        ));
  }

  _getSchedule() async {
    _scheduleController.getSchedule(
        widget.idCard, DateFormat('yyyy-MM-dd').format(_selectDate));
  }

  _showSchedule() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _scheduleController.scheduleList.length,
          itemBuilder: (_, index) {
            Schedule schedule = _scheduleController.scheduleList[index];
            print(schedule.regisID);
            if (schedule.registerDate.toString().split(" ")[0] ==
                DateFormat('yyyy-MM-dd').format(_selectDate)) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Detail(
                            adres: widget.adres,
                            des: schedule.address!,
                            id: schedule.regisID!,
                            type: schedule.type,
                            locationc: widget.locationc));
                      },
                      child: TaskTile(schedule),
                    )
                  ]))));
            } else
              return Container();
          });
    }));
  }

  _dateBar() {
    return Container(
      color: Colors.teal.shade100,
      padding: EdgeInsets.only(right: 15, left: 15),
      margin: const EdgeInsets.only(top: 10),
      child: DatePicker(
        DateTime.now(),
        height: 85,
        width: 60,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.teal,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.teal,
        ),
        dayTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.teal,
        ),
        monthTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.teal,
        ),
        onDateChange: (date) {
          _selectDate = date;
          _getSchedule();
          setState(() {});
        },
      ),
    );
  }
}
