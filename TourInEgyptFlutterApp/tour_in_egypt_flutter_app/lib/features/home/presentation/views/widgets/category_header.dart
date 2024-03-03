import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/governorate_model.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_rating.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';

// ignore: must_be_immutable
class CategoryHeader extends StatefulWidget {
  CategoryHeader({super.key, required this.categoryModel});

  TempCategoryModel categoryModel;
  @override
  State<CategoryHeader> createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {
  @override
  Widget build(BuildContext context) {
    DisplayCategoryProvider display =
        Provider.of<DisplayCategoryProvider>(context);
    return Container(
      height: 240,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.categoryModel.picture),
              fit: BoxFit.fill),
          //borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              color: ConstColors.backgroundDarkMode,
              offset: Offset(0, 1),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.categoryModel.isFavourite =
                          !widget.categoryModel.isFavourite;
                      display.getLikedList(display.displayCategory);
                    });
                  },
                  icon: widget.categoryModel.isFavourite
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
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.categoryModel.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
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
                      widget.categoryModel.location,
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
                      categoryModel: widget.categoryModel,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
