import 'package:flutter/material.dart';
import 'package:mtacsystem/Network/covid_service.dart';
import 'package:mtacsystem/models/ApiCovid.dart';
import '../Home/covidStatistics.dart';


class CovidStats extends StatefulWidget{
    @override
    _VNState createState() => _VNState();
}

class _VNState extends State<CovidStats> {
  // late Future<List<SummaryCovid>> summary;
  late Future<SummaryModel> summary;
  @override
  initState(){
    super.initState();
    summary = CovidService.getCountrySummary();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder<SummaryModel>(
      future: summary,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text('${snapshot.error}',));
        }
        switch(snapshot.connectionState){
          case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
          default: return !snapshot.hasData 
                  ? Center(child: Text("Empty"),)
                  : CovidStatistics(
                    summary: snapshot.data!,
                  );
          // CovidStatistics(
          //     summary: snapshot.data!,
          //   );
        }
      }
    );
  }
}