import 'package:flutter/material.dart';
import 'package:mtacsystem/Network/covid_service.dart';
import 'package:mtacsystem/models/ApiCovid.dart';
import '../Home/covidStatistics.dart';

CovidService c_service = CovidService();

class CovidStats extends StatefulWidget{
    @override
    _VNState createState() => _VNState();
}

class _VNState extends State<CovidStats> {
  late Future<List<SummaryCovid>> summary;

  @override
  initState(){
    super.initState();
    summary = c_service.getCountrySummary(); 
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<SummaryCovid>>(
      future: summary,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }
        switch(snapshot.connectionState){
          case ConnectionState.waiting: return Center(child: Text('loading'),);
          default: !snapshot.hasData 
          ? Center(child: Text("Emty"),) 
          : Center(child: Text("data here"));
          // CovidStatistics(
          //     summary: snapshot.data!,
          //   );
        }
        return Center(child: Text('E2rror'),);
      }
    );
  }
}