import 'package:flutter/material.dart';

import '../widgets/home_screen_city_card.dart';

class HomeScreenCityCardBuilder extends StatelessWidget {
  const HomeScreenCityCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
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
