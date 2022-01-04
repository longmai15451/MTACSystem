import 'package:flutter/material.dart';
import 'package:mtacsystem/models/ApiCovid.dart';
import 'package:shimmer/shimmer.dart';


class CovidStatistics extends StatelessWidget{
  final SummaryModel summary;
  CovidStatistics({required this.summary});
  @override
  Widget build(BuildContext context){
    return Stack( 
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
                _statComponent(
                5, 3, 0,
                [Colors.red.shade50, Colors.red.shade300],
                Colors.red.shade300.withOpacity(0.3),
                'assets/images/infected.png', Colors.red.shade900,
                summary.cases.toString(), Colors.red.shade900,
                'Số ca nhiễm', Colors.red.shade900,
                ),
                _statComponent(
                5, 0, 0,
                [Colors.green.shade50, Colors.green.shade300],
                Colors.green.shade200.withOpacity(0.3),
                'assets/images/recovered.png', Colors.green.shade900,
                summary.recovered.toString(), Colors.green.shade900,
                'Số ca phục hồi', Colors.green.shade900,
                ),
                _statComponent(
                5, 0, 3,
                [Colors.grey.shade300, Colors.grey.shade600],
                Colors.grey.shade300.withOpacity(0.3),
                'assets/images/grave.png', Colors.black87,
                summary.deaths.toString(), Colors.black87,
                'Số ca tử vong', Colors.black87,
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
    Color titleColor
    )
    {
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
          end: FractionalOffset.topRight
        ),
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
                size: 50.0,
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
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: titleColor,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
            )
          )
        ],
      ),
    );
  }
}