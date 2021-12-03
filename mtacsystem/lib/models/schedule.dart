
class Schedule{
  String? regisID;
  String? title;
  String? note;
  String? address;
  String? registerDate;
  String? registerTime;
  var type;

  Schedule({
    this.regisID,
    this.title,
    this.note,
    this.registerDate,
    this.registerTime,
    this.type,
  });

  Schedule.fromJson(Map<String, dynamic> json){
    regisID = json['regisID'];
    title = json['title'];
    note = json['note'];
    address = json['address'];
    registerDate = json['registerDate'];
    registerTime = json['registerTime'];
    type = json['type'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regisID'] = this.regisID;
    data['title'] = this.title;
    data['note'] = this.note;
    data['address'] = this.address;
    data['registerDate'] = this.registerDate;
    data['registerTime'] = this.registerTime;
    data['type'] = this.type;
    return data;
  }
}