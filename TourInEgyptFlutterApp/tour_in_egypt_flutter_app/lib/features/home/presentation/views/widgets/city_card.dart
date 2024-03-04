import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/city_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.cityModel});
  final CityModel cityModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              // child: Image.network(
              //   ApiService.imagesBaseUrl + cityModel.famousPlacePath!,
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: double.infinity,
              // ),
              child: CachedNetworkImage(
                imageUrl: ApiService.imagesBaseUrl + cityModel.famousPlacePath!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const SizedBox(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: ConstColors.primaryGoldColor,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
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
              top: 80,
              bottom: 0,
              left: 16,
              child: Row(
                children: [
                  ConstIcons.solidLocationIcon,
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    cityModel.cityName!,
                    style: GoogleFonts.roboto(
                      color: ConstColors.backgroundLightMode,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.52,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 16,
              child: Text(
                cityModel.famousPlaceName!,
                style: GoogleFonts.roboto(
                  color: ConstColors.backgroundLightMode,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 30,
              child: Text(
                '30°C',
                style: GoogleFonts.roboto(
                  color: ConstColors.primaryGoldColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
