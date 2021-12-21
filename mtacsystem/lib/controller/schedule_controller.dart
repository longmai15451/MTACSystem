import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/schedule.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class ScheduleController extends GetxController{
  static var scheduleVac;
  static var scheduleTest;

  var scheduleList = <Schedule>[].obs;

  Future <List<Schedule>> fetchVaccineData(String idCard, String registerDate) async {
    String url = sver.serverip+'/CAP1_mobile/vaccine_schedule.php'; 
    final response =
      await http.post(Uri.parse(url),body: 
        {
          "id_card" : idCard,
          "registerDate" : registerDate,
        }
      );
    if (response.statusCode == 200) {
      if(response.body == '"Error"')
      {
        List<Schedule> sc = new List.empty();
          return sc;
      }
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Schedule.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future <List<Schedule>> fetchTestData(String idCard, String registerDate) async {
    String url = sver.serverip+'/CAP1_mobile/test_schedule.php'; 
    final response =
      await http.post(Uri.parse(url),body: 
        {
          "id_card" : idCard,
          "registerDate" : registerDate,
        }
      );
    if (response.statusCode == 200) {
      if(response.body == '"Error"')
      {
        List<Schedule> sc = new List.empty();
          return sc;
      }
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Schedule.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  void getSchedule(String idCard, String registerDate) async{
    scheduleVac = await fetchVaccineData(idCard,registerDate);
    scheduleTest = await fetchTestData(idCard,registerDate);
    scheduleList.clear();
    scheduleList.addAll(scheduleVac);
    scheduleList.addAll(scheduleTest);
    scheduleList.sort((a, b) {
      return a.registerTime.toString().compareTo(b.registerTime.toString());
    });    
  }

}