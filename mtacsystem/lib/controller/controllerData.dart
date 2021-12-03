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
  late TextEditingController des = new TextEditingController();
  late TextEditingController vac = new TextEditingController();
  late TextEditingController hos = new TextEditingController();
  late TextEditingController registerDate = new TextEditingController();
  late String? idDes;
  late String? idVac;
  late String? idHos;
  late String registerTime;
  late String startTime;
  late String endTime;
}

class TestRegister{
  late TextEditingController hos = new TextEditingController();
  late TextEditingController registerDate = new TextEditingController();
  late String? idHos;
  late String registerTime;
  late String startTime;
  late String endTime;
}