import 'package:tour_in_egypt_flutter_app/core/models/governorate_model.dart';


class StaticCategoryData {
  static GovernorateModel governorateModel =
      GovernorateModel(categoryName: "Restaurants", categoryOptions: [
    "All",
    "Quick Bites",
    "Fine Dining"
  ], categoryModel: [
    TempCategoryModel(
        name: "Elset Amina Kitchen",
        picture: "assets/restaurantsImages/elset_amina.png",
        location: "106 Hassan Ma'moon An Nadi Al Ahli, Nasr City, Cairo",
        rate: 4.0,
        isFavourite: true,
        option: "Fine Dining"),
    TempCategoryModel(
        name: "Koshary Sayed Hanafy",
        picture: "assets/restaurantsImages/sayed_hanafy.png",
        location: "106 Hassan Ma'moon,An Nadi Al Ahli, Nasr City, Cairo",
        rate: 4.0,
        isFavourite: true,
        option: "Quick Bites"),
    TempCategoryModel(
        name: "Koshary Abu Tarek",
        picture: "assets/restaurantsImages/abu_tarek.png",
        location: "106 Hassan Ma'moon,An Nadi Al Ahli, Nasr City, Cairo",
        rate: 4.0,
        isFavourite: true,
        option: "Quick Bites"),
  ]);
}
