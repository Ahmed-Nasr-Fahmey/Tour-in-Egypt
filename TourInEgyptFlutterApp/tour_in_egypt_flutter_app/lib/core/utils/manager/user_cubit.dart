import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/core/models/post_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/user_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  UserModel userModel = UserModel();
  List<UserModel> stories = [];
  List<PostModel> posts = [];

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
}
