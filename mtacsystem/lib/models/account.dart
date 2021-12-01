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
  String? anamnesisID;
  String? anamnesis1;
  String? anamnesis2;
  String? anamnesis3;
  String? anamnesis4;
  String? anamnesis5;
  String? anamnesis6;
  String? anamnesis7;
  String? anamnesis8;
  String? anamnesis9;
  String? anamnesis10;

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
      required this.nation,
      required this.password,
      required this.avatar,
      required this.anamnesisID,
      required this.anamnesis1,
      required this.anamnesis2,
      required this.anamnesis3,
      required this.anamnesis4,
      required this.anamnesis5,
      required this.anamnesis6,
      required this.anamnesis7,
      required this.anamnesis8,
      required this.anamnesis9,
      required this.anamnesis10});

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
    nation = json['nation'];
    password = json['password'];
    avatar = json['avatar'];
    anamnesisID = json['anamnesisID'];
    anamnesis1 = json['anamnesis1'];
    anamnesis2 = json['anamnesis2'];
    anamnesis3 = json['anamnesis3'];
    anamnesis4 = json['anamnesis4'];
    anamnesis5 = json['anamnesis5'];
    anamnesis6 = json['anamnesis6'];
    anamnesis7 = json['anamnesis7'];
    anamnesis8 = json['anamnesis8'];
    anamnesis9 = json['anamnesis9'];
    anamnesis10 = json['anamnesis10'];
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
    data['password'] = this.password;
    data['avatar'] = this.avatar;
    data['anamnesisID'] = this.anamnesisID;
    data['anamnesis1'] = this.anamnesis1;
    data['anamnesis2'] = this.anamnesis2;
    data['anamnesis3'] = this.anamnesis3;
    data['anamnesis4'] = this.anamnesis4;
    data['anamnesis5'] = this.anamnesis5;
    data['anamnesis6'] = this.anamnesis6;
    data['anamnesis7'] = this.anamnesis7;
    data['anamnesis8'] = this.anamnesis8;
    data['anamnesis9'] = this.anamnesis9;
    data['anamnesis10'] = this.anamnesis10;
    return data;
  }
}
