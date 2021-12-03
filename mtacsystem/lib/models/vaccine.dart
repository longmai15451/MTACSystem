class Vaccine{
  var idVac;
  String? vacName;
  String? country;
  String? description;
  var ageUseFrom;
  var ageUseTo;

  Vaccine({
    this.idVac,
    this.vacName,
    this.country,
    this.description,
    this.ageUseFrom,
    this.ageUseTo,
  });

  Vaccine.fromJson(Map<String, dynamic> json){
    idVac = json['id'];
    vacName = json['name'];
    country = json['country'];
    description = json['description'];
    ageUseFrom = json['age_use_from'];
    ageUseTo = json['age_use_to'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_vac'] = this.idVac;
    data['vac_name'] = this.vacName;
    data['description'] = this.description;
    data['age_use_from'] = this.ageUseFrom;
    data['age_use_to'] = this.ageUseTo;
    return data;
  }
}