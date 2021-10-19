import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mtacsystem/models/ApiCovid.dart';

class CovidService{

  Future<List<SummaryCovid>> getCountrySummary() async{
    final data = await http.Client().get(Uri.parse("https://api.covid19api.com/total/dayone/country/vn"));
    
    if(data.statusCode != 200)
      throw Exception();

    List<SummaryCovid> summaryList = (json.decode(data.body) as List).map((item) => new SummaryCovid.fromJson(item)).toList();
    
    return summaryList;
  }
  List<SummaryCovid> summaryList(String responseBody){
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SummaryCovid>((json) => SummaryCovid.fromJson(json)).toList();
  }
}