import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/home_screen_city_card_builder.dart';

class CitiesView extends StatelessWidget {
  const CitiesView({super.key});
  static const String routeName = 'CitiesView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Cities',
          hasBackgroundColor: true,
          hasBackIcon: true,
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                'The great Cairo',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                'Alexandria',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                'Delta',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                'Suez Canal',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                'North Upper Egypt',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                'Middle of Upper Egypt',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text(
                'south of Upper Egypt',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HomeScreenCityCardBuilder(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}
