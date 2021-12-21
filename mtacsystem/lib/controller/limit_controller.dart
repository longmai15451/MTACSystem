import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/server/Server.dart' as sver;

class LimitController{

  Future<Map<String, dynamic>> getLimitData(String idHos, String date, String urlLink) async {
    String url = sver.serverip+urlLink;
    print(url);
    var response = await http.post(Uri.parse(url), body: {
      "id_hos": idHos,
      "registerDate" : date,
    });
    var json = jsonDecode(response.body);
    print(json);
    var result = {
        "7-9": json['7-9']=="1"?true:false,
        "9-11": json['9-11']=="1"?true:false,
        "13-15": json['13-15']=="1"?true:false,
        "15-17": json['15-17']=="1"?true:false,
        "17-19": json['17-19']=="1"?true:false,
        "19-21": json['19-21']=="1"?true:false,
        "limit": json['limit'],
    };
    return result;
  }

}