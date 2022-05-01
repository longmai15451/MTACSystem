class Diseases{
  String? idDiseases;
  String? diseaseName;
  String? price;

  Diseases({
    this.idDiseases,
    this.diseaseName,
    this.price
  });

  Diseases.fromJson(Map<String, dynamic> json){
    idDiseases = json['id'];
    diseaseName = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_vac'] = this.idDiseases;
    data['vac_name'] = this.diseaseName;
    return data;
  }
}