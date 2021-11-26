import 'package:flutter/material.dart';
import 'package:mtacsystem/models/ApiCovid.dart';
import 'package:shimmer/shimmer.dart';


class CovidStatistics extends StatelessWidget{
  final SummaryModel summary;
  CovidStatistics({required this.summary});
  @override
  Widget build(BuildContext context){
    return Stack( //Covid Tracked đăng ký ấy khi thành công n phải nhảy qua bên đăng nhập chứ chưa lm
      children: <Widget>[
         Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: 190.0,
          width: 370.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 2))
            ],
            gradient: LinearGradient(
                colors: [Colors.red.shade100, Colors.green.shade100,Colors.grey.shade200],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight
            ),
          ),
          child: Column(
            children: [
               Shimmer.fromColors(
          baseColor: Colors.red.shade600,
          highlightColor: Colors.red.shade200,
          child: Container(
                height: 30,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Thống kê tình trạng Covid-19 tại Việt Nam',
                      style: TextStyle(
                          color: Colors.red.shade600, 
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        )
                      ),
                  ],
                )
              ),
               ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
              margin: EdgeInsets.only(
                  top: 5,
                  left: 3,
                ),
              height: 150.0,
              width: 105.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: [Colors.red.shade50, Colors.red.shade300],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.shade300.withOpacity(0.3),
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
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
        ),
        Container(
              margin: EdgeInsets.only(
                  top: 5,
                ),
              height: 150.0,
              width: 105.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Colors.green.shade50, Colors.green.shade300],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade200.withOpacity(0.3),
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
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
              ),
        Container(
                margin: EdgeInsets.only(
                  top: 5,
                  right: 3,
                ),
                height: 150.0,
                width: 105.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade300, Colors.grey.shade600],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.3),
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
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
              ),
        ],
        ),
            ],
          ),
        ),
        
      ],
    );
  }
}