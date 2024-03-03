import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/static_category_data.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/governorate_category_card.dart';
class GovernorateCategoryCardBuilder extends StatelessWidget {
  const GovernorateCategoryCardBuilder({
    super.key,
    required this.display,
  });

  final DisplayCategoryProvider display;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GovernorateCategoryCard(
          categoryModel: display.displayCategory == []
              ? StaticCategoryData.governorateModel.categoryModel
              : display.displayCategory,
          index: index,
        );
      },
      itemCount: display.displayCategory.length,
    );
  }
}
