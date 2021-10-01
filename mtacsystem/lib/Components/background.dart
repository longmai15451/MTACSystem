import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          Positioned(
            top: -130,
            child: Image.asset(
              "assets/images/logo.png",
              width: size.width
            ),
          ),
        ],
      ),
    );
  }
}