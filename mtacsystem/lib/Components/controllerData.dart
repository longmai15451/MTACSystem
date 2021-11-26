import 'package:flutter/material.dart';

class TempUserProfile {
  late TextEditingController avatar;
  late TextEditingController name;
  late TextEditingController birthdate;
  late TextEditingController gender;
  late TextEditingController phone;
  late TextEditingController idcard;
  late TextEditingController email;
  late TextEditingController nation;
  late TextEditingController job;
  late TextEditingController healthCard;
  late TextEditingController city;
  late TextEditingController district;
  late TextEditingController ward;
  late TextEditingController address;
  late TextEditingController country;
  late List<TextEditingController> anamnesis = new List.filled(10, TextEditingController(text:'0') ,growable:false);
}

class VacRegister{
  late TextEditingController idVac = new TextEditingController();
  late TextEditingController idHos = new TextEditingController();
  late TextEditingController registerDate = new TextEditingController(text: '2021-11-27');
  late TextEditingController registerTime = new TextEditingController(text:'13:00:00');
  late String startTime;
  late String endTime;
}