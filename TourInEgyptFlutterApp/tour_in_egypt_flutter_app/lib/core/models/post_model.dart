import 'dart:io';

import 'package:tour_in_egypt_flutter_app/core/models/user_model.dart';

class PostModel {
  String? postID;
  String? contentPath;
  String? contentType;
  String? placeName;
  String? description;
  String? hashtags;
  String? location;
  String? longitude;
  String? latitude;
  int? likes;
  int? comments;
  UserModel? userModel;
  DateTime? createdAt;
  File? postFile;
  PostModel({
    this.postID,
    this.contentPath,
    this.contentType,
    this.placeName,
    this.description,
    this.hashtags,
    this.location,
    this.longitude,
    this.latitude,
    this.likes,
    this.comments,
    this.userModel,
    this.createdAt,
    this.postFile,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postID: json['_id'],
      contentPath: json['contentPath'],
      contentType: json['contentType'],
      placeName: json['placeName'],
      description: json['description'],
      hashtags: json['hashtags'],
      location: json['location'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      likes: json['likes'],
      comments: json['comments'],
      userModel:
          json['userId'] != null ? UserModel.fromJson(json['userId']) : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }
}
