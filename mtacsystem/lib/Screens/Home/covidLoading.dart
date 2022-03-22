import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CovidLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 2))
            ],
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey.shade100],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _loadingConponent(
                Colors.yellow.shade300,
                Colors.yellow.shade100,
                [Colors.yellow.shade200, Colors.red.shade200],
                Colors.black.withOpacity(0.3),
              ),
              _loadingConponent(
                Colors.green.shade300,
                Colors.green.shade100,
                [Colors.green.shade300, Colors.green.shade300],
                Colors.green.withOpacity(0.3),
              ),
              _loadingConponent(
                Colors.red.shade300,
                Colors.red.shade100,
                [
                  Colors.red.shade300,
                  Colors.grey.shade600,
                ],
                Colors.black.withOpacity(0.3),
              ),
            ],
          ), //
        ),
      ],
    );
  }

  _loadingConponent(Color baseColor, Color highlightColor,
      List<Color> grandientColor, Color boxShadowColor) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
        height: 150.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              colors: grandientColor,
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
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              // margin: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(top: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 30,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}
