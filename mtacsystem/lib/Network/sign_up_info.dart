import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mtacsystem/server/Server.dart' as sver;

class SignUpInfo{
  
  Future<Map<String, dynamic>> getVacRegisterData(String regisID) async {
    String url = sver.serverip+'/CAP1_mobile/vaccination_info.php';
    var response = await http.post(Uri.parse(url),body: {
        "regisId": regisID,
    });
    var json = jsonDecode(response.body);
    print(json);
    var result = {
        "full_name": json['fullname'],
        "phone": json['phone'],
        "id_card": json['id_card'],
        "hos_name": json['hos_name'],
        "disease": json['disease_name'],
        "vaccine": json['vaccine_name'],
        "register_date": json['registerDate'],
        "register_time": json['registerTime'],
        "price":json['price'],
        "status":json['status'],
        "hos_address": json['hos_address'], 
    };
    return result;
  }
  Future<Map<String, dynamic>> getTestRegisterData(String regisID) async {
    String url = sver.serverip+'/CAP1_mobile/test_info.php';
    var response = await http.post(Uri.parse(url),body: {
        "regisId": regisID,
    });
    var json = jsonDecode(response.body);
    print(json);
    var result = {
        "full_name": json['fullname'],
        "phone": json['phone'],
        "id_card": json['id_card'],
        "hos_name": json['hos_name'],
        "register_date": json['registerDate'],
        "register_time": json['registerTime'],
        "hos_address": json['hos_address'], 
    };
    return result;
  }
}