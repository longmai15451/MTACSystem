class Diseases{
  String? idDiseases;
  String? diseaseName;

  Diseases({
    this.idDiseases,
    this.diseaseName
  });

  Diseases.fromJson(Map<String, dynamic> json){
    idDiseases = json['id'];
    diseaseName = json['name'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_vac'] = this.idDiseases;
    data['vac_name'] = this.diseaseName;
    return data;
  }
}