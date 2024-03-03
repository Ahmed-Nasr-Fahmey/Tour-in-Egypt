class GovernorateModel {
  String categoryName;
  List<String> categoryOptions;
  List<TempCategoryModel> categoryModel;

  GovernorateModel({
    required this.categoryName,
    required this.categoryOptions,
    required this.categoryModel,
  });
}

class TempCategoryModel {
  String name;
  String picture;
  String location;
  double rate;
  bool isFavourite = false;
  String option;

  TempCategoryModel({
    required this.name,
    required this.picture,
    required this.location,
    required this.rate,
    required this.isFavourite,
    required this.option,
  });
}
