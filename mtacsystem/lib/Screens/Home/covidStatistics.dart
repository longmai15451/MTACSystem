import 'package:flutter/material.dart';
import 'package:mtacsystem/models/ApiCovid.dart';
import 'package:shimmer/shimmer.dart';

class CovidStatistics extends StatelessWidget {
  final SummaryModel summary;
  CovidStatistics({required this.summary});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          height: 220.0,
          width: 370.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.teal.withOpacity(0.6),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: Offset(0, 16))
            ],
            gradient: LinearGradient(
                colors: [Colors.white70, Colors.white70, Colors.white70],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight),
          ),
          child: Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.teal,
                highlightColor: Colors.red,
                child: Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Thống kê về tình trạng Covid-19 tại Việt Nam',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _statComponent(
                    5,
                    5,
                    5,
                    [Colors.yellow.shade50, Colors.yellow.shade300],
                    Colors.black.withOpacity(0.2),
                    'assets/images/infected.png',
                    Colors.black87,
                    summary.cases.toString(),
                    Colors.black87,
                    'Số ca nhiễm',
                    Colors.black,
                  ),
                  _statComponent(
                    5,
                    5,
                    5,
                    [Colors.green.shade100, Colors.green.shade400],
                    Colors.black.withOpacity(0.2),
                    'assets/images/recovered.png',
                    Colors.green.shade800,
                    summary.recovered.toString(),
                    Colors.green.shade800,
                    'Số ca phục hồi',
                    Colors.green.shade800,
                  ),
                  _statComponent(
                    5,
                    5,
                    5,
                    [Colors.red.shade300, Colors.red.shade400],
                    Colors.black.withOpacity(0.2),
                    'assets/images/grave.png',
                    Colors.black87,
                    summary.deaths.toString(),
                    Colors.black87,
                    'Số ca tử vong',
                    Colors.black87,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _statComponent(
      double top,
      double left,
      double right,
      List<Color> gradientColor,
      Color boxShadowColor,
      String image,
      Color imageColor,
      String data,
      Color dataColor,
      String title,
      Color titleColor) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
      ),
      height: 150.0,
      width: 105.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            colors: gradientColor,
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.topRight),
        boxShadow: [
          BoxShadow(
              color: boxShadowColor,
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
              AssetImage(image),
              size: 35.0,
              color: imageColor,
            ),
          ),
          Container(
              // margin: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                data,
                style: TextStyle(
                    color: dataColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 30,
              width: 140,
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
