import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/city_view.dart';

class HomeScreenCityCard extends StatelessWidget {
  const HomeScreenCityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: CityView.routeName),
        screen: const CityView(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ),
      child: SizedBox(
        height: 160,
        width: 200,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/%D9%82%D9%84%D8%B9%D9%87_%D8%B5%D9%84%D8%A7%D8%AD_%D8%A7%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D8%A3%D9%8A%D9%88%D8%A8%D9%8A_23.jpg/1200px-%D9%82%D9%84%D8%B9%D9%87_%D8%B5%D9%84%D8%A7%D8%AD_%D8%A7%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D8%A3%D9%8A%D9%88%D8%A8%D9%8A_23.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(1),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ConstIcons.solidLocationIcon,
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Cairo',
                          style: GoogleFonts.roboto(
                            color: ConstColors.backgroundLightMode,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.52,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          bottom: 8,
                          child: Text(
                            'Salah al-den’s castle',
                            style: GoogleFonts.roboto(
                              color: ConstColors.backgroundLightMode,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 170,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 6,
                          child: Text(
                            '30°C',
                            style: GoogleFonts.roboto(
                              color: ConstColors.primaryGoldColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
