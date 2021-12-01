import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class SignUpInfo{
  
  Future<Map<String, dynamic>> getRegisterData(String idCard, String idVac, String idHos, String date, String time) async {
    String url = 'http://mtac1.000webhostapp.com/CAP1_mobile/vaccination_info.php';
    var response = await http.post(Uri.parse(url),body: {
        "id_card": idCard,
        "id_vac": idVac,
        "id_hos": idHos,
        "registerDate" : date,
        "registerTime" : time
    });
    var json = jsonDecode(response.body);
    var result = {
        "full_name": json['full_name'],
        "phone": json['phone'],
        "id_card": json['id_card'],
        "hos_name": json['hos_name'],
        "vaccine": json['vaccine_name'],
        "register_date": json['registerDate'],
        "register_time": json['registerTime'],
        "hos_address": json['hos_address'], 
    };
    return result;
  }


}