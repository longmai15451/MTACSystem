import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:mtacsystem/models/ApiCovid.dart';

class CovidService{
  static const String url = 'https://disease.sh/v3/covid-19/countries/vietnam';

  static Future<SummaryModel> getCountrySummary() async{

    final response = await http.get(Uri.parse('$url'));
    if(response.statusCode == 200){
      return compute(summaryList,response.body);
    }
    else if (response.statusCode == 404){
      throw Exception('Not Found');
    }
    else{
      throw Exception('Can\'t get data');
    }
  }
  static SummaryModel summaryList(String responseBody){
    SummaryModel summary = new SummaryModel.fromJson(json.decode(responseBody));
    return summary;
  }
}