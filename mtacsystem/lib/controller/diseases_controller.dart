import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/diseases.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class DiseaseController{
  Future <List<Diseases>> fetchData() async {
    String url = sver.serverip+'/CAP1_mobile/disease_data.php';
    final response =
      await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Diseases.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
  Future <List<Diseases>> fetch(String idHos) async {
    String url = sver.serverip+'/CAP1_mobile/hos_disease.php';
    final response =
    await http.post(Uri.parse(url), body:
    {
      "id_hos" : idHos,
    }
    );
    print(response.body);
    var data = json.decode(response.body);
    if(data=='Error')
    {
      throw 'Bệnh viện đang bận';
    }
    print(data);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new Diseases.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}