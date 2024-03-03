import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/edit_profile_view.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routName = 'ProfileView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Profile',
          hasBackgroundColor: true,
          hasBackIcon: false,
          actions: [
            IconButton(
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings:
                      const RouteSettings(name: EditProfileView.routeName),
                  screen: const EditProfileView(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              icon: const Icon(
                Icons.edit,
                size: 18,
                color: ConstColors.primaryGoldColor,
              ),
            )
          ],
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}
