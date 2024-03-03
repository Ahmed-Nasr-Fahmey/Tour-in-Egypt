import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/governorate_model.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_rating.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/category_details_view.dart';

class GovernorateCategoryCard extends StatefulWidget {
  const GovernorateCategoryCard(
      {super.key, required this.index, required this.categoryModel});
  final List<TempCategoryModel> categoryModel;
  final int index;

  @override
  State<GovernorateCategoryCard> createState() =>
      _GovernorateCategoryCardState();
}

class _GovernorateCategoryCardState extends State<GovernorateCategoryCard> {
  @override
  Widget build(BuildContext context) {
    DisplayCategoryProvider display =
        Provider.of<DisplayCategoryProvider>(context);
    return InkWell(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.categoryModel[widget.index].picture),
                fit: BoxFit.fill),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: ConstColors.backgroundDarkMode,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.75),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.categoryModel[widget.index].isFavourite =
                          !widget.categoryModel[widget.index].isFavourite;
                      display.getLikedList(widget.categoryModel);
                    });
                  },
                  icon: widget.categoryModel[widget.index].isFavourite
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image(
                            image: AssetImage("assets/Heart_Filled.png"),
                            height: 20,
                          ),
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image(
                            image: AssetImage("assets/Heart_Not_Filled.png"),
                            height: 20,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.categoryModel[widget.index].name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: ConstColors.primaryGoldColor,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          widget.categoryModel[widget.index].location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomRating(
                          categoryModel: widget.categoryModel[widget.index],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        ///ToDo Screen View
        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
          context,
          settings: const RouteSettings(name: CategoryDetailsView.routeName),
          screen: const CategoryDetailsView(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
    );
  }
}
