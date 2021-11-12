class AccountProfile {
  late String idCard;
  late String fullName;
  late String birthDate;
  late String gender;
  late String healthCard;
  late String phone;
  late String email;
  late String job;
  late String address;
  late String ward;
  late String district;
  late String city;
  late String country;
  late String password;

  AccountProfile(
      {required this.idCard,
      required this.fullName,
      required this.birthDate,
      required this.gender,
      required this.healthCard,
      required this.phone,
      required this.email,
      required this.job,
      required this.address,
      required this.ward,
      required this.district,
      required this.city,
      required this.country,
      required this.password});

  AccountProfile.fromJson(Map<String, dynamic> json) {
    idCard = json['id_card'];
    fullName = json['full_name'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    healthCard = json['health_card'];
    phone = json['phone'];
    email = json['email'];
    job = json['job'];
    address = json['address'];
    ward = json['ward'];
    district = json['district'];
    city = json['city'];
    country = json['country'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_card'] = this.idCard;
    data['full_name'] = this.fullName;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['health_card'] = this.healthCard;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['job'] = this.job;
    data['address'] = this.address;
    data['ward'] = this.ward;
    data['district'] = this.district;
    data['city'] = this.city;
    data['country'] = this.country;
    data['password'] = this.password;
    return data;
  }
}
