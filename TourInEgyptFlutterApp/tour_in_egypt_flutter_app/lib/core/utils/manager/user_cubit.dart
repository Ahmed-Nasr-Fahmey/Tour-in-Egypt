import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/post_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/user_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserModel userModel = UserModel();
  List<UserModel> stories = [];
  List<PostModel> posts = [];
  List<CityModel> cities = [];
  List<CityCategoryModel> restaurants = [];

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
          tempCities.add(CityModel.fromJson(city));
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
          tempRestaurants.add(CityCategoryModel.fromJson(restaurant));
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
}
