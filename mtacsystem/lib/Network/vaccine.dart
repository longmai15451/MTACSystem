import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Vaccine{
  
  Future<Map<String, dynamic>> getVaccineData() async {
    String url = '';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var result = {
        "id_vac": json['id'],
        "name": json['name'],
        "country": json['country'],
        "description": json['description'],
        "age_use_from": json['age_use_from'],
        "age_use_to": json['age_use_to'],
    };
    return result;
  }


}