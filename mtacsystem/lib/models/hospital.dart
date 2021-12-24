class Hospital{
  var idHos;
  String? hosName;
  String? hosAddress;

  Hospital({
    this.idHos,
    this.hosName,
    this.hosAddress,
  });

  Hospital.fromJson(Map<String, dynamic> json){
    idHos = json['id'];
    hosName = json['name'];
    hosAddress= json['address'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_hos'] = this.idHos;
    data['hos_name'] = this.hosName;
    data['hos_address'] = this.hosAddress;
    return data;
  }
}