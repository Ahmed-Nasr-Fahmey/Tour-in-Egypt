import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/core/models/governorate_model.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/static_category_data.dart';

class DisplayCategoryProvider extends ChangeNotifier{

  List<TempCategoryModel> displayCategory = List.from(StaticCategoryData.governorateModel.categoryModel);
  List<TempCategoryModel> likedList = [];

  void filterOptionsCategories(String category,List<TempCategoryModel> categoryM) {

    displayCategory = List.from(categoryM);
    displayCategory = categoryM
        .where((e) => e.option.toLowerCase().contains(category.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void getAll (List<TempCategoryModel> category){
    displayCategory = List.from(category);
    notifyListeners();
  }

  void getLikedList(List<TempCategoryModel> categories){
    likedList = categories.where((e) => e.isFavourite == true).toList();
    notifyListeners();
  }
}