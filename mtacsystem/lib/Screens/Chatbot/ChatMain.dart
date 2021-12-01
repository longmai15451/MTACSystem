import 'package:flutter/material.dart';
import 'package:mtacsystem/Screens/Chatbot/chat.dart';

class Dialogflow extends StatefulWidget {
  @override
  _Dialogflow createState() => _Dialogflow();
}

class _Dialogflow extends State<Dialogflow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tư vấn'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Chat()),
    );
  }
}