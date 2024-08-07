part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

// stories

class StoriesLoadingState extends UserState {}

class StoriesSuccessState extends UserState {}

class StoriesFailureState extends UserState {
  final String erorrMessage;
  StoriesFailureState({required this.erorrMessage});
}

// posts

class PostsLoadingState extends UserState {}

class PostsSuccessState extends UserState {}

class PostsFailureState extends UserState {
  final String erorrMessage;
  PostsFailureState({required this.erorrMessage});
}

// Cities

class CitiesLoadingState extends UserState {}

class CitiesSuccessState extends UserState {}

class CitiesFailureState extends UserState {
  final String erorrMessage;
  CitiesFailureState({required this.erorrMessage});
}

// Restaurants

class RestaurantsLoadingState extends UserState {}

class RestaurantsSuccessState extends UserState {}

class RestaurantsFailureState extends UserState {
  final String erorrMessage;
  RestaurantsFailureState({required this.erorrMessage});
}

// Restaurants

class CafesLoadingState extends UserState {}

class CafesSuccessState extends UserState {}

class CafesFailureState extends UserState {
  final String erorrMessage;
  CafesFailureState({required this.erorrMessage});
}