import 'package:get/get.dart';
import 'package:mtacsystem/db/dbHelper.dart';
import 'package:mtacsystem/models/schedule.dart';

class ScheduleController extends GetxController{
  
  @override
  void onReady(){
    super.onReady();
  }

  var scheduleList = <Schedule>[].obs;

  Future<int> addSchedule({Schedule? schedule}) async {
    return await DBHelper.insert(schedule);
  }

  void getSchedule() async{
    List<Map<String, dynamic>> schedule = await DBHelper.query();
    scheduleList.assignAll(schedule.map((data) => new Schedule.fromJson(data)).toList());
  }

  static delete(Schedule schedule){
    DBHelper.delete(schedule);
  }
}