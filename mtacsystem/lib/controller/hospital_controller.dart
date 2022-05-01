import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/hospital.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class HospitalController{
  Future<List<Hospital>> fetchData() async {
    String url = sver.serverip+'/CAP1_mobile/hostpital_data.php'; 
    final response =
      await http.post(Uri.parse(url),body: {
        "city": sver.city.toString(),
      });
    var check = json.decode(response.body);
    if(check=='Error')
    {
      throw 'Khu vực chưa được đăng ký!';
    }
    print(check);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Hospital.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}