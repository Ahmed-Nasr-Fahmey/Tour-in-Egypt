import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/static_category_data.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/governorate_category_card.dart';

class GovernorateCategoryCardBuilder extends StatelessWidget {
  const GovernorateCategoryCardBuilder({
    super.key,
    required this.restaurants,
  });
  final List<CityCategoryModel> restaurants;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return GovernorateCategoryCard(
              categoryModel: restaurants[index],
              index: index,
            );
          },
          itemCount: restaurants.length,
        );
      },
    );
  }
}
