class CityModel {
  String? cityID;
  String? cityName;
  String? region;
  String? famousPlaceName;
  String? famousPlacePath;
  String? temperature;
  CityModel({
    this.cityID,
    this.cityName,
    this.region,
    this.famousPlaceName,
    this.famousPlacePath,
  });

  // Factory constructor
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      cityID: json['_id'],
      cityName: json['cityName'],
      region: json['region'],
      famousPlaceName: json['famousPlaceName'],
      famousPlacePath: json['famousPlacePath'],
    );
  }
}
