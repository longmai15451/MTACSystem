class Limit {
  var idHos;
  var sevenToNine;
  var nineToEleven;
  var thirteenToFifteen;
  var fifteenToSeventeen;
  var seventeenToNineteen;
  var limit;

  Limit({
    this.idHos,
    this.sevenToNine,
    this.nineToEleven,
    this.thirteenToFifteen,
    this.fifteenToSeventeen,
    this.seventeenToNineteen,
    this.limit,
  });

  Limit.fromJson(Map<String, dynamic> json){
    idHos = json['id_hos'];
    sevenToNine = json['7-9'];
    nineToEleven = json['9-11'];
    thirteenToFifteen = json['13-15'];
    fifteenToSeventeen = json['15-17'];
    seventeenToNineteen = json['17-19'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_hos'] = this.idHos;
    data['7-9'] = this.sevenToNine;
    data['9-11'] = this.nineToEleven;
    data['13-15'] = this.thirteenToFifteen;
    data['15-17'] = this.fifteenToSeventeen;
    data['17-19'] = this.seventeenToNineteen;
    data['limit'] = this.limit;
    return data;
  }

}