import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/hospital.dart';

class HospitalController{
  Future<List<Hospital>> fetchData() async {
    String url = 'http://mtac1.000webhostapp.com/CAP1_mobile/hostpital_data.php'; 
    final response =
      await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Hospital.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}