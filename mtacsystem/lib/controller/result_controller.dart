import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/diseases.dart';
import 'package:mtacsystem/models/result.dart';
import 'package:mtacsystem/server/Server.dart' as sver;

class ResultController{
  Future <List<Diseases>> fetchData(String idCard) async {
    String url = sver.serverip+'/CAP1_mobile/Get_disease.php'; 
    final response =
      await http.post(Uri.parse(url),body: {
        'idCard': idCard,
      });
    if (response.statusCode == 200) {
      try{
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new Diseases.fromJson(data)).toList();
       }
      catch(e){
        throw 'Không tìm thấy kết quả đăng ký của bạn!';
      }
    } else {
      throw Exception('Không tìm thấy kết quả đăng ký của bạn!');
    }
  }

  Future<List<VacResult>> fetchVResultData(String idCard, String idDis)async{
    String url = sver.serverip+'/CAP1_mobile/Vac_Result.php';
    final response = await http.post(Uri.parse(url),body:{
      'idCard': idCard,
      'idDis': idDis,
    });
    if (response.statusCode == 200) {
      try{
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new VacResult.fromJson(data)).toList();
      }
      catch(e){
        throw 'Không tìm thấy kết quả tiêm của bạn!';
      }
    } else {
      throw 'Không tìm thấy kết quả tiêm của bạn!';
    }
  }

  Future<List<TestResult>> fetchTResultData(String idCard)async{
    String url = sver.serverip+'/CAP1_mobile/Test_Result.php';
    final response = await http.post(Uri.parse(url),body:{
      'idCard': idCard,
    });
    if (response.statusCode == 200) {
      try{
      List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => new TestResult.fromJson(data)).toList();
      }
      catch(e){
        throw 'Không tìm thấy kết quả xét nghiệm của bạn!';
      }
    } else {
      throw 'Không tìm thấy kết quả xét nghiệm của bạn!';
    }
  }
}