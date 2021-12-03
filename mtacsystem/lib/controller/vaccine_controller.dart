import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/vaccine.dart';

class VaccineController{
  Future <List<Vaccine>> fetchData(String idDes) async {
    String url = 'http://mtac1.000webhostapp.com/CAP1_mobile/vaccine_data.php'; 
    final response =
      await http.post(Uri.parse(url), body: 
        {
          "id_desease" : idDes,
        }
      );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Vaccine.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}