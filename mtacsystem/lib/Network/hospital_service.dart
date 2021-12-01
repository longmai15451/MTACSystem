import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HospitalService{
  
  Future<Map<String, dynamic>> getHospitalData() async {
    String url = '';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var result = {
        "id_hos": json['id_hos'],
        "name": json['name'],
        "phone": json['phone'],
        "address": json['address'],
    };
    return result;
  }


}