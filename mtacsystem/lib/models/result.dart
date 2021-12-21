class VacResult{
  String? injectionTime;
  String? vaccineName;
  String? datatime;
  String? address;

  VacResult({
    this.injectionTime,
    this.vaccineName,
    this.datatime,
    this.address,
  });

  VacResult.fromJson(Map<String, dynamic> json){
    injectionTime = json['injection_times'];
    vaccineName = json['vaccine_name'];
    datatime = json['datetime'];
    address = json['hos_address'];
  }
}

class TestResult{
  String? diseaseName;
  String? datatime;
  String? address;

  TestResult({
    this.diseaseName,
    this.datatime,
    this.address,
  });

  TestResult.fromJson(Map<String, dynamic> json){
    diseaseName = json['disease_name'];
    datatime = json['datetime'];
    address = json['hos_address'];
  }
}