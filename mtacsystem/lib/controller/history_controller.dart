import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/schedule.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class HistoryController extends GetxController{
  var historyList = <Schedule>[].obs;

  Future <List<Schedule>> fetchHistoryData(String idCard) async {
    String url = sver.serverip+'/CAP1_mobile/vaccine_history.php'; 
    final response =
      await http.post(Uri.parse(url),body: 
        {
          "id_card" : idCard,
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

  void getSchedule(String idCard) async{
    var list = await fetchHistoryData(idCard);
    historyList.clear();
    historyList.addAll(list);
  }

}