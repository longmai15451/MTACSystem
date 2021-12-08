import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/server/Server.dart' as sver;

class LimitController{

  Future<Map<String, dynamic>> getLimitData(String idHos, String date) async {
    String url = sver.serverip+'/CAP1_mobile/limit.php';
    var response = await http.post(Uri.parse(url), body: {
      "id_hos": idHos,
      "date" : date,
    });
    var json = jsonDecode(response.body);
    var result = {
        "7-9": json['7-9'],
        "9-11": json['9-11'],
        "13-15": json['13-15'],
        "15-17": json['15-17'],
        "17-19": json['17-19'],
        "limit": json['limit'],
    };
    return result;
  }

}