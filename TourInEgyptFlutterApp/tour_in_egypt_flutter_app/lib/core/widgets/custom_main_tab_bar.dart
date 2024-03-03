import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_in_egypt_flutter_app/core/models/governorate_model.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/manager/display_filter_provider.dart';
import 'custom_main_tab_bar_options.dart';

class CustomMainTabBar extends StatefulWidget {
  const CustomMainTabBar({super.key, required this.governorateModel});

  final GovernorateModel governorateModel;
  @override
  State<CustomMainTabBar> createState() => _CustomMainTabBarState();
}

class _CustomMainTabBarState extends State<CustomMainTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    DisplayCategoryProvider display =
        Provider.of<DisplayCategoryProvider>(context);

    return DefaultTabController(
      initialIndex: selectedIndex,
      length: widget.governorateModel.categoryOptions.length,
      child: TabBar(
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
              if (selectedIndex == 0) {
                display.getAll(widget.governorateModel.categoryModel);
              } else {
                display.filterOptionsCategories(
                    widget.governorateModel.categoryOptions[selectedIndex],
                    widget.governorateModel.categoryModel);
              }
            },
          );
        },
        indicator: const BoxDecoration(),
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
        tabs: widget.governorateModel.categoryOptions.map((e) {
          return CustomMainTabBarOptions(
            name: e,
            index: selectedIndex ==
                    widget.governorateModel.categoryOptions.indexOf(e)
                ? selectedIndex
                : -1,
          );
        }).toList(),
      ),
    );
  }
}
