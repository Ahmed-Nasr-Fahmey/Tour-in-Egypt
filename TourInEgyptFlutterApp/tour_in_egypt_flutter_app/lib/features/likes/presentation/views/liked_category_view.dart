import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/governorate_category_card.dart';

class LikedCategoryView extends StatefulWidget {
  const LikedCategoryView({super.key});
  static const String routeName = 'LikedCategoryView';
  @override
  State<LikedCategoryView> createState() => _LikedCategoryViewState();
}

class _LikedCategoryViewState extends State<LikedCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Liked Restaurants',
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
                        index: index, categoryModel: CityCategoryModel());
                  },
                  separatorBuilder: (context, _) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: 1),
            ),
          ],
        ),
      ),
    );
  }
}
