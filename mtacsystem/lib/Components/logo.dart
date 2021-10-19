import 'package:flutter/material.dart';

class Logo {
    static getAppBar(){
      return AppBar(
      backgroundColor: Colors.white,
      title: Image.asset(
        'assets/images/logo.png',
        width: 80.0,
        height: 80.0,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      centerTitle: true,
      toolbarHeight: 80.0,
    );
  }
} 