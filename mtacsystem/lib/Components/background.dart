import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  final Widget child;
  Background({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: ListView(
      children: <Widget>[
        child,
        ],
      ),
    );
  }
}