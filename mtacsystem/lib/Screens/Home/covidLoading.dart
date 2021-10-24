import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CovidLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack( //Covid Tracked đăng ký ấy khi thành công n phải nhảy qua bên đăng nhập chứ chưa lm
      children: <Widget>[
         Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: 180.0,
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
                end: FractionalOffset.topRight
            ),
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Shimmer.fromColors(
          baseColor: Colors.red.shade300,
          highlightColor: Colors.red.shade100,
          child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
          height: 150.0,
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
              Container(
                margin: EdgeInsets.only(top: 5),
                
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
        ),),
        Shimmer.fromColors(
          baseColor: Colors.green.shade300,
          highlightColor: Colors.green.shade100,
          child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
          height: 150.0,
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
              Container(
                margin: EdgeInsets.only(top: 5),
                
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
          ),),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
            height: 150.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Colors.grey.shade300, Colors.grey.shade600,],
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
                
              ),
              
              Container(
                // margin: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 10.0),
                
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                height: 50,
                width: 150,
              )
            ],
          ),
          ),),
        ],
        ),//ê m thấy n sao sao k ở dưới to ở trên nhỏ 
        ),
        
      ],
    );
  }
}