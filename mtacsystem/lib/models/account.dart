class AccountProfile {
  String? idCard;
  String? fullName;
  String? birthDate;
  String? gender;
  String? healthCard;
  String? phone;
  String? email;
  String? job;
  String? address;
  String? ward;
  String? district;
  String? city;
  String? country;
  String? nation;
  String? password;
  String? avatar;

  AccountProfile({
    required this.idCard,
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
    required this.avatar,
    required this.nation,
    required this.password,
  });

  AccountProfile.fromJson(Map<String, dynamic> json) {
    idCard = json['id_card'];
    fullName = json['fullname'];
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
    nation = json['nation'];
    password = json['password'];
    avatar = json['avatar'];
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
    data['nation'] = this.nation;
    data['avatar'] = this.avatar;
    data['password'] = this.password;
    return data;
  }
}
