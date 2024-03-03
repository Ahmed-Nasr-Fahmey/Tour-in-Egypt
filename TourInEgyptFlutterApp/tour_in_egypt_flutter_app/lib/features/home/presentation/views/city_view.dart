import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_see_all_row.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/categoris_card_builder.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/city_card.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/widgets/city_places_builder.dart';

class CityView extends StatelessWidget {
  const CityView({super.key});
  static const String routeName = 'CityName';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomMainAppBar(
          title: 'Cairo',
          hasBackgroundColor: true,
          hasBackIcon: true,
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: CityCard()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(
                'Discover Cairo',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: CategoriesCardBuilder(),
          ),
          const SliverToBoxAdapter(
            child: CustomSeeAllRow(text: 'Active now in Cairo'),
          ),
          const SliverToBoxAdapter(
            child: CityPlacesBuilder(),
          ),
          const SliverToBoxAdapter(
            child: CustomSeeAllRow(text: 'Suggested Places'),
          ),
          const SliverToBoxAdapter(
            child: CityPlacesBuilder(),
          ),
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
