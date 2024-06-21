import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/core/models/catigory_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/governorate_category_card.dart';

class LikedCategoryView extends StatefulWidget {
  const LikedCategoryView(
      {super.key,
      required this.categoryModel,
      required this.cityCategoryModel});
  static const String routeName = 'LikedCategoryView';
  final CategoryModel categoryModel;
  final List<CityCategoryModel> cityCategoryModel;
  @override
  State<LikedCategoryView> createState() => _LikedCategoryViewState();
}

class _LikedCategoryViewState extends State<LikedCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Liked ${widget.categoryModel.categoryName}',
          hasBackgroundColor: true,
          hasBackIcon: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GovernorateCategoryCard(
                      categoryModel: widget.cityCategoryModel[index]);
                },
                separatorBuilder: (context, _) => const SizedBox(
                  height: 20,
                ),
                itemCount: widget.cityCategoryModel.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
