import 'package:flutter/material.dart';
import 'package:mtacsystem/models/ApiCovid.dart';

class CovidStatistics extends StatelessWidget{
  final SummaryCovid summary;
  CovidStatistics({required this.summary});
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
      height: 140.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            colors: [Colors.red.shade100, Colors.red.shade200],
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.topRight
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 2))
        ],
      ),
      child: Column(
        children: <Widget>[
          ImageIcon(
            AssetImage('assets/images/infected.png'),
                size: 50.0,
                color: Colors.red[900],
          ),
          Container(
            // margin: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(top: 5.0),
            child: Text(
              '800.100',
              style: TextStyle(
                color: Colors.red[900],
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 25.0),
            height: 60,
            width: 150,
            child: Text(
              'Số ca nhiễm',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.red[900],
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
            )
          )
        ],
      ),
    );
  }
}