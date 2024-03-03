import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/catigory_card.dart';
import 'package:tour_in_egypt_flutter_app/features/likes/presentation/views/liked_category_view.dart';

class LikesCategoriesCardBuilder extends StatelessWidget {
  const LikesCategoriesCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 170,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: ConstLists.categoriesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width * 0.0035,
            crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
            mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
          ),
          itemBuilder: (context, index) {
            return CatigoryCard(
              imageType: 'Asset',
              categoryModel: ConstLists.categoriesList[index],
              onTap: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings:
                      const RouteSettings(name: LikedCategoryView.routeName),
                  screen: const LikedCategoryView(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            );
          },
        ),
      ),
    );
  }
}