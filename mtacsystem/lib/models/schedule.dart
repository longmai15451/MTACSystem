
class Schedule{
  int? id;
  var idCard;
  int? idVac;
  int? idHos;
  String? title;
  String? note;
  String? registerDate;
  String? registerTime;

  Schedule({
    this.id,
    this.idCard,
    this.idVac,
    this.idHos,
    this.title,
    this.note,
    this.registerDate,
    this.registerTime,
  });

  Schedule.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idCard = json['id_card'];
    idVac = json['id_vac'];
    idHos = json['id_hos'];
    title = json['title'];
    note = json['note'];
    registerDate = json['registerDate'];
    registerTime = json['registerTime'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_card'] = this.idCard;
    data['id_vac'] = this.idVac;
    data['id_hos'] = this.idHos;
    data['title'] = this.title;
    data['note'] = this.note;
    data['registerDate'] = this.registerDate;
    data['registerTime'] = this.registerTime;
    return data;
  }
}