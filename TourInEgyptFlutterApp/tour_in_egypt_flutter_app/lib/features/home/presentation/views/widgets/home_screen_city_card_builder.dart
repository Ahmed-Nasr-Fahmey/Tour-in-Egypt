import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_model.dart';

import '../widgets/home_screen_city_card.dart';

class HomeScreenCityCardBuilder extends StatelessWidget {
  const HomeScreenCityCardBuilder({
    super.key,
    required this.cities,
  });
  final List<CityModel> cities;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(
              bottom: 16,
              left: 16,
            ),
            child: HomeScreenCityCard(),
          );
        },
      ),
    );
  }
}
