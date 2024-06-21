import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';

class ProfileScreenReelCard extends StatelessWidget {
  const ProfileScreenReelCard({
    super.key, required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 180,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // child: Image.network(
              //   'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/%D9%82%D9%84%D8%B9%D9%87_%D8%B5%D9%84%D8%A7%D8%AD_%D8%A7%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D8%A3%D9%8A%D9%88%D8%A8%D9%8A_23.jpg/1200px-%D9%82%D9%84%D8%B9%D9%87_%D8%B5%D9%84%D8%A7%D8%AD_%D8%A7%D9%84%D8%AF%D9%8A%D9%86_%D8%A7%D9%84%D8%A3%D9%8A%D9%88%D8%A8%D9%8A_23.jpg',
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: double.infinity,
              // ),
              child: CachedNetworkImage(
                imageUrl:
                    ApiService.baseUrl + imageUrl,
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
          ],
        ),
      ),
    );
  }
}
