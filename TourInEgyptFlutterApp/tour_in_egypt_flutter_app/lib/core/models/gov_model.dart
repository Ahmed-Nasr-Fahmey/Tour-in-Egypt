class GovModel {
  String govName;
  String govPicture;
  String govTemp;
  String popularAreaName;
  List<CategoryModel> categoryModel;

  GovModel({
    required this.govName,
    required this.govPicture,
    required this.govTemp,
    required this.popularAreaName,
    required this.categoryModel,
  });
}

class CategoryModel {
  String catName;
  String categoryImageUrl;
  List<String> catOptions;
  List<AreaModel> areaModel;

  CategoryModel({
    required this.catName,
    required this.catOptions,
    required this.categoryImageUrl,
    required this.areaModel,
  });
}

class AreaModel {
  String name;
  String picture;
  String location;
  String option;
  double rate;
  bool isFavourite = false;

  AreaModel({
    required this.name,
    required this.picture,
    required this.location,
    required this.rate,
    required this.isFavourite,
    required this.option,
  });
}
