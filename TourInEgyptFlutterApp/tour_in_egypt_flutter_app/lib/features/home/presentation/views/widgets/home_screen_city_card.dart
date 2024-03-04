import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/city_view.dart';

class HomeScreenCityCard extends StatelessWidget {
  const HomeScreenCityCard({
    super.key,
    required this.cityModel,
  });
  final CityModel cityModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: CityView.routeName),
        screen: CityView(cityModel: cityModel),
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
                 ApiService.imagesBaseUrl + cityModel.famousPlacePath!,
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
                          cityModel.cityName!,
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
                            cityModel.famousPlaceName!,
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
