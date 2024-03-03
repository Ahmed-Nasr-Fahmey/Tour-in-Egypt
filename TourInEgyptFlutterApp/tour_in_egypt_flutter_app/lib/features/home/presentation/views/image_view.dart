import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  static const String routeName = 'ImageView';
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomMainAppBar(
          title: '',
          hasBackIcon: true,
          hasBackgroundColor: false,
        ),
      ),
      body: PhotoViewGallery.builder(
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(
              ApiService.imagesBaseUrl + imageUrl,
            ),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(),
      ),
    );
  }
}
