class Country {
  final String name;
  final int cases;
  final int died;
  final int recovered;

  Country({
    required this.name,
    required this.cases,
    required this.died,
    required this.recovered,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      cases: json['cases'],
      died: json['died'],
      recovered: json['recovered'],
    );
  }
}
