import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_see_all_row.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/cities_view.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/settings_view.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/home_screen_city_card_builder.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/home_screen_reels_card_builder.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/post_card_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundLightMode,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: ConstColors.backgroundLightMode,
        actions: [
          IconButton(onPressed: () {}, icon: ConstIcons.solidMicrophoneIcon),
          IconButton(onPressed: () {}, icon: ConstIcons.solidNotificationsIcon),
          IconButton(
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: SettingsView.routeName),
                  screen: const SettingsView(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              icon: ConstIcons.solidSetteingsIcon),
        ],
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Let’s Explore Egypt',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: HomeScreenReelsCardBuilder(),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0.1),
              child: const Divider(
                height: 0,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomSeeAllRow(
              text: 'Cities',
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: CitiesView.routeName),
                  screen: const CitiesView(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(
              cities: BlocProvider.of<UserCubit>(context).cities,
            ),
          ),
          const PostCardBuilder(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 65,
            ),
          ),
        ],
      ),
    );
  }
}
