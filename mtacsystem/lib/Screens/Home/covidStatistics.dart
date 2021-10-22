import 'package:flutter/material.dart';
import 'package:mtacsystem/models/ApiCovid.dart';
class CovidStatistics extends StatelessWidget{
  final SummaryModel summary;
  CovidStatistics({required this.summary});
  @override
  Widget build(BuildContext context){
    return Stack( //Covid Tracked đăng ký ấy khi thành công n phải nhảy qua bên đăng nhập chứ chưa lm
      children: <Widget>[
         Container(
           margin: EdgeInsets.only(left: 10),
          height: 180.0,
          width: 380.0,
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
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
          height: 150.0,
          width: 110.0,
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
              Container(
                margin: EdgeInsets.only(top: 5),
                child: ImageIcon(
                AssetImage('assets/images/infected.png'),
                    size: 50.0,
                    color: Colors.red[900],
              ),
              ),
              
              Container(
                // margin: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  summary.cases.toString(),
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 30,
                width: 150,
                child: Text(
                  'Số ca nhiễm',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                )
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
          height: 150.0,
          width: 110.0,
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
              Container(
                margin: EdgeInsets.only(top: 5),
                child: ImageIcon(
                AssetImage('assets/images/recovered.png'),
                    size: 50.0,
                    color: Colors.green[900],
              ),
              ),
              
              Container(
                // margin: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  summary.recovered.toString(),
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 30,
                width: 150,
                child: Text(
                  'Số ca phục hồi',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                )
              )
            ],
          ),
          ),
        Container(
            margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
            height: 150.0,
            width: 110.0,
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
              Container(
                margin: EdgeInsets.only(top: 5),
                child: ImageIcon(
                AssetImage('assets/images/grave.png'),
                    size: 50.0,
                    color: Colors.black87,
              ),
              ),
              
              Container(
                // margin: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  summary.deaths.toString(),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 30,
                width: 150,
                child: Text(
                  'Số ca tử vong',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16
                    ,
                    fontWeight: FontWeight.w500
                  ),
                )
              )
            ],
          ),
          ),
        ],
        ),//ê m thấy n sao sao k ở dưới to ở trên nhỏ 
        ),
        
      ],
    );
  }
}