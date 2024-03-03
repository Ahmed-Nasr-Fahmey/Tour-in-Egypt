import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/governorate_model.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key, required this.categoryModel});

  final TempCategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: false,
      itemSize: 16,
      initialRating: categoryModel.rate,
      minRating: 0.5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      unratedColor: Colors.white70,
      itemBuilder: (context, _) =>
          const Image(image: AssetImage(ConstIcons.starFilled)),
      onRatingUpdate: (double value) {},
    );
  }
}
