import 'package:flutter/material.dart';

class TempUserProfile {
  late TextEditingController avatar;
  late TextEditingController name;
  late TextEditingController birthdate = new TextEditingController();
  late TextEditingController gender = new TextEditingController();
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
}

class VacRegister{
  late TextEditingController des = new TextEditingController();
  late TextEditingController hos = new TextEditingController();
  late TextEditingController registerDate = new TextEditingController();
  late String? idDes;
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