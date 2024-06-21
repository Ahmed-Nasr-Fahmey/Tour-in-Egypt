import 'package:tour_in_egypt_flutter_app/core/models/city_model.dart';

class CityCategoryModel {
  String? categoryID;
  CityModel? cityModel;
  String? name;
  String? description;
  String? location;
  String? address;
  String? longitude;
  String? latitude;
  String? picture;
  bool isFavorits = false;
  // ignore: prefer_typing_uninitialized_variables
  var rate;
  int numberOfRatings = 0;
  bool activeNow = false;
  String? categoryName;

  CityCategoryModel({
    this.categoryID,
    this.cityModel,
    this.name,
    this.description,
    this.location,
    this.address,
    this.longitude,
    this.latitude,
    this.picture,
    this.rate = 0,
    this.numberOfRatings = 0,
    this.activeNow = false,
  });

  factory CityCategoryModel.fromJson(Map<String, dynamic> json) {
    return CityCategoryModel(
      categoryID: json['_id'],
      cityModel: CityModel.fromJson(json['cityId']),
      name: json['name'],
      description: json['description'],
      location: json['location'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      picture: json['picture'],
      rate: json['rate'] ?? 0,
      numberOfRatings: json['numberOfRatings'] ?? 0,
      activeNow: json['activeNow'] ?? false,
    );
  }
}
