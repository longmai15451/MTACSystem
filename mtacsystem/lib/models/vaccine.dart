class Vaccine{
  var idVac;
  String? vacName;
  String? country;
  String? description;
  var ageUseFrom;
  var ageUseTo;
  var diseaseName;
  var symptom;
  var price;
  var quantity;

  Vaccine({
    this.idVac,
    this.vacName,
    this.country,
    this.description,
    this.ageUseFrom,
    this.ageUseTo,
    this.diseaseName,
    this.symptom,
    this.price,
    this.quantity,
  });

  Vaccine.fromJson(Map<String, dynamic> json){
    idVac = json['id'];
    vacName = json['name'];
    country = json['country'];
    description = json['description'];
    ageUseFrom = json['age_use_from'];
    ageUseTo = json['age_use_to'];
    diseaseName = json['disease_name'];
    symptom = json['symptom'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_vac'] = this.idVac;
    data['vac_name'] = this.vacName;
    data['description'] = this.description;
    data['age_use_from'] = this.ageUseFrom;
    data['age_use_to'] = this.ageUseTo;
    data['disease_name'] = this.diseaseName;
    data['symptom'] = this.symptom;
    return data;
  }
}