import 'package:flutter/material.dart';
import 'package:mtacsystem/models/ApiCovid.dart';
class CovidStatistics extends StatelessWidget{
  final SummaryModel summary;
  CovidStatistics({required this.summary});
  @override
  Widget build(BuildContext context){
    return Stack( //Covid Tracked
      children: <Widget>[
        Container(
          
          height: 155.0,
          width: 355.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 2))
            ],
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey.shade100],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight
            ),
          ),
        ),
        
        Container(
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
                  summary.cases.toString(),
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
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                )
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 5,
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 140.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Colors.green.shade200, Colors.green.shade300],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 2))
              ],
            ),
            child: Column(
            children: <Widget>[
              ImageIcon(
                AssetImage('assets/images/recovered.png'),
                    size: 50.0,
                    color: Colors.green[900],
              ),
              Container(
                // margin: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  summary.recovered.toString(),
                  style: TextStyle(
                    color: Colors.green[900],
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
                  'Số ca phục hồi',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                )
              )
            ],
          ),
          ),
        ),
        Positioned(
          top: 0,
          left: 130,
          child: Container(
            margin: EdgeInsets.fromLTRB(2.5, 5, 5, 5),
            height: 140.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Colors.black26, Colors.black38],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 2))
              ],
            ),
            child: Column(
            children: <Widget>[
              ImageIcon(
                AssetImage('assets/images/death.png'),
                    size: 50.0,
                    color: Colors.black87,
              ),
              Container(
                // margin: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 5.0),
                child: Text(
                  summary.deaths.toString(),
                  style: TextStyle(
                    color: Colors.black87,
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
                  'Số ca tử vong',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                )
              )
            ],
          ),
          ),
        ),
      ],
    );
  }
}