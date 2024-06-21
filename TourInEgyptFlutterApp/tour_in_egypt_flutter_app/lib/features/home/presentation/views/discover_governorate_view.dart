import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_category_model.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_tab_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/static_category_data.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/governorate_category_card_builder.dart';

class DiscoverGovernorateView extends StatefulWidget {
  const DiscoverGovernorateView({
    Key? key,
    required this.title,
    required this.cityModel,
  }) : super(key: key);

  static const String routeName = "DiscoverGovernorateView";
  final String title;
  final CityModel cityModel;

  @override
  _DiscoverGovernorateViewState createState() =>
      _DiscoverGovernorateViewState();
}

class _DiscoverGovernorateViewState extends State<DiscoverGovernorateView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundLightMode,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomMainAppBar(
          title: widget.title,
          hasBackgroundColor: true,
          hasBackIcon: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(ConstIcons.subtract),
                color: ConstColors.primaryGoldColor,
                height: 18,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(ConstIcons.filter),
                color: ConstColors.primaryGoldColor,
                height: 22,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          CustomMainTabBar(
              governorateModel: StaticCategoryData.governorateModel),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: GovernorateCategoryCardBuilder(
                categoryModel: _getCategoryModel(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<CityCategoryModel> _getCategoryModel(BuildContext context) {
    if (widget.title == 'Restaurants') {
      return BlocProvider.of<UserCubit>(context)
          .restaurants
          .where(
              (element) => element.cityModel?.cityID == widget.cityModel.cityID)
          .toList();
    } else if (widget.title == 'Cafes') {
      return BlocProvider.of<UserCubit>(context)
          .cafes
          .where(
              (element) => element.cityModel?.cityID == widget.cityModel.cityID)
          .toList();
    } else {
      return [];
    }
  }
}
