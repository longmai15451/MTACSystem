class SummaryCovid{
  final String country;
  final int confirmed;
  final int death;
  final int recovered;
  final int active;
  final DateTime date;

  const SummaryCovid({
    required this.country, 
    required this.confirmed, 
    required this.death, 
    required this.recovered, 
    required this.active, 
    required this.date
  });

  factory SummaryCovid.fromJson(Map<String, dynamic> json){
    return SummaryCovid(
      country: json["Country"] as String,
      confirmed: json["Confirmed"] as int,
      death: json["Deaths"] as int,
      recovered: json["Recovered"] as int,
      active: json["Active"] as int,
      date: DateTime.parse(json["Date"]),
    );
  }
}