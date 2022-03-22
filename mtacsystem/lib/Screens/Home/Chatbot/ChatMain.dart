import 'package:flutter/material.dart';
import 'chat.dart';

class Dialogflow extends StatefulWidget {
  @override
  _Dialogflow createState() => _Dialogflow();
}

class _Dialogflow extends State<Dialogflow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TƯ VẤN'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.teal.shade50,
        child: Center(
          child: Chat()),
      ),
    );
  }
 
}