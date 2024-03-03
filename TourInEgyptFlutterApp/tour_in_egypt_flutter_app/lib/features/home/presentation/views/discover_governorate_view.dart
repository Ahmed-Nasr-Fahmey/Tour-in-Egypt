import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_tab_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/static_category_data.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/governorate_category_card_builder.dart';

class DiscoverGovernorateView extends StatefulWidget {
  const DiscoverGovernorateView({super.key});

  static const String routeName = "DiscoverGovernorateView";

  @override
  State<DiscoverGovernorateView> createState() =>
      _DiscoverGovernorateViewState();
}

class _DiscoverGovernorateViewState extends State<DiscoverGovernorateView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    DisplayCategoryProvider display =
        Provider.of<DisplayCategoryProvider>(context);
    return Scaffold(
      backgroundColor: ConstColors.backgroundLightMode,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomMainAppBar(
          title: "Restaurants",
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
          const SizedBox(
            height: 16,
          ),
          CustomMainTabBar(
              governorateModel: StaticCategoryData.governorateModel),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: GovernorateCategoryCardBuilder(display: display),
            ),
          ),
        ],
      ),
    );
  }
}
