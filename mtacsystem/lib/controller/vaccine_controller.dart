import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/vaccine.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class VaccineController extends GetxController{
  Future <List<Vaccine>> fetchData(String idDes) async {
    String url = sver.serverip+'/CAP1_mobile/vaccine_data.php'; 
    final response =
      await http.post(Uri.parse(url), body: 
        {
          "id_disease" : idDes,
        }
      );
    print(response.body);
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Vaccine.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  var vaccineList = <Vaccine>[].obs;

  Future <List<Vaccine>> fetchDataforSearch() async {
    String url = 'http://192.168.1.101/CAP1_mobile/vaccine_data_forSearch.php'; 
    final response =
      await http.post(Uri.parse(url),);
    print(response.body);
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Vaccine.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  void getSearchData()async{
    var list = await fetchDataforSearch();
    vaccineList.addAll(list);
  }

}