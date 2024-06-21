import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/post_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/user_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/weather_api_service.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserModel userModel = UserModel();
  List<UserModel> stories = [];
  List<PostModel> posts = [];
  PostModel postModel = PostModel();
  List<CityModel> cities = [];
  List<CityCategoryModel> restaurants = [];
  List<CityCategoryModel> cafes = [];
  List<CityCategoryModel> favorites = [];

  // get Stories

  Future<void> getAllUsers() async {
    emit(StoriesLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.getAllUsers(
        token: userModel.token!,
      );
      if (data['message'] == 'Successfully fetched all users') {
        List<UserModel> tempStories = [];
        for (var user in data['users']) {
          tempStories.add(UserModel.fromJson(user));
        }
        stories = tempStories;
        emit(StoriesSuccessState());
      } else if (data['message'] == 'Internal Server Error') {
        emit(StoriesFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(StoriesFailureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  // get Stories

  Future<void> getAllPosts() async {
    emit(PostsLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.getAllPosts(
        token: userModel.token!,
      );
      if (data['message'] == 'Successfully fetched all posts') {
        List<PostModel> tempPosts = [];
        for (var post in data['posts']) {
          tempPosts.add(PostModel.fromJson(post));
        }
        tempPosts.shuffle();
        posts = tempPosts;
        emit(PostsSuccessState());
      } else if (data['message'] == 'Internal Server Error') {
        emit(PostsFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(PostsFailureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  // Cities
  Future<void> getCities() async {
    emit(CitiesLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.getCities(
        token: userModel.token!,
      );
      if (data['message'] == 'Cities retrieved successfully') {
        List<CityModel> tempCities = [];
        for (var city in data['cities']) {
          CityModel tempCity = CityModel.fromJson(city);
          Map<String, dynamic> data = await WeatherApiService.getCityWeather(
              cityName: tempCity.cityName!);
          if (data["current"] != null && data["current"]["temp_c"] != null) {
            tempCity.weather = data["current"]["temp_c"].toString();
            log(tempCity.cityName!);
            log(data["current"]["temp_c"].toString());
          } else {
            tempCity.weather = "30";
            log(tempCity.cityName!);
            log("30");
          }
          tempCities.add(tempCity);
        }
        cities = tempCities;
        emit(CitiesSuccessState());
      } else if (data['message'] == 'Internal Server Error') {
        emit(CitiesFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(CitiesFailureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  // Restaurants
  Future<void> getRestaurants() async {
    emit(RestaurantsLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.getRestaurants(
        token: userModel.token!,
      );
      if (data['message'] == 'Restaurants retrieved successfully') {
        List<CityCategoryModel> tempRestaurants = [];
        for (var restaurant in data['restaurants']) {
          CityCategoryModel categoryModel =
              CityCategoryModel.fromJson(restaurant);
          categoryModel.categoryName = 'restaurants';
          tempRestaurants.add(categoryModel);
        }
        restaurants = tempRestaurants;
        emit(RestaurantsSuccessState());
      } else if (data['message'] == 'Internal Server Error') {
        emit(RestaurantsFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(RestaurantsFailureState(
          erorrMessage: 'There was an error, try again.'));
    }
  }

  // Cafes
  Future<void> getCafes() async {
    emit(CafesLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.getCafes(
        token: userModel.token!,
      );
      if (data['message'] == 'Cafes retrieved successfully') {
        List<CityCategoryModel> tempCafes = [];
        for (var restaurant in data['cafes']) {
          CityCategoryModel categoryModel =
              CityCategoryModel.fromJson(restaurant);
          categoryModel.categoryName = 'cafes';
          tempCafes.add(categoryModel);
        }
        cafes = tempCafes;
        emit(CafesSuccessState());
      } else if (data['message'] == 'Internal Server Error') {
        emit(CafesFailureState(
            erorrMessage: 'Internal Server Error, try later.'));
      }
    } on Exception {
      emit(CafesFailureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  Future<Map<String, dynamic>> createPost() async {
    Map<String, dynamic> data = await ApiService.createPost(
      token: userModel.token!,
      postModel: postModel,
    );
    postModel = PostModel();
    return data;
  }
}
