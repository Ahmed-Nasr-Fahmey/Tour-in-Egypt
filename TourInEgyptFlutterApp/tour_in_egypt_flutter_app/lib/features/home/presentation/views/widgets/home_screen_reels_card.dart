import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/user_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/image_view.dart';

class HomeScreenReelCard extends StatelessWidget {
  const HomeScreenReelCard({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
          context,
          settings: const RouteSettings(name: ImageView.routeName),
          screen: ImageView(imageUrl: userModel.picture!),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ConstColors.primaryGoldColor),
                ),
                Positioned(
                  top: 3,
                  left: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      width: 54,
                      height: 54,

                      // backgroundImage: NetworkImage(
                      //     'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg'),
                      child: CachedNetworkImage(
                        imageUrl: ApiService.imagesBaseUrl + userModel.picture!,
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
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              userModel.userName!,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                color: ConstColors.primaryBlueColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
