import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/post_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/image_view.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.postModel,
  });
  final PostModel postModel;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 560,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Card(
        elevation: 8,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: ConstColors.primaryGoldColor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: ConstColors.primaryGoldColor,
                        radius: 27,
                        child: CircleAvatar(
                          radius: 25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: ApiService.imagesBaseUrl +
                                  widget.postModel.userModel!.picture!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          color: ConstColors.backgroundLightMode,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: ConstIcons.solidCorrectIcon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.postModel.userModel!.userName!,
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat('dd MMM yyyy  h:mm a')
                            .format(widget.postModel.createdAt!),
                        style: GoogleFonts.roboto(
                          color: ConstColors.primaryBlueColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Follow',
                    style: GoogleFonts.roboto(
                      color: ConstColors.primaryGoldColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ConstIcons.solidFollowIcon,
                ],
              ),
            ),
            widget.postModel.contentType == 'Image'
                ? GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                            const RouteSettings(name: ImageView.routeName),
                        screen:
                            ImageView(imageUrl: widget.postModel.contentPath!),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height * 0.5,
                        child: Image.network(
                          ApiService.imagesBaseUrl +
                              widget.postModel.contentPath!,
                          fit: BoxFit.cover,
                        ),
                        // child: CachedNetworkImage(
                        // imageUrl: ApiService.imagesBaseUrl +
                        //     widget.postModel.contentPath!,
                        //   // imageUrl:
                        //   //     'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg',
                        //   imageBuilder: (context, imageProvider) => Container(
                        //     decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //         image: imageProvider,
                        //         fit: BoxFit.cover,
                        //       ),
                        //     ),
                        //   ),
                        //   placeholder: (context, url) => const SizedBox(),
                        //   errorWidget: (context, url, error) => const Icon(
                        //     Icons.error,
                        //     color: ConstColors.primaryGoldColor,
                        //   ),
                        // ),
                      ),
                    ),
                  )
                : const SizedBox(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text.rich(
                  maxLines: !isExpanded ? 3 : null,
                  overflow: !isExpanded ? TextOverflow.ellipsis : null,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.postModel.placeName} ",
                        style: const TextStyle(
                          color: Color(0xFF00599E),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: widget.postModel.description,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      widget.postModel.hashtags != null
                          ? TextSpan(
                              text: '\n${widget.postModel.hashtags}',
                              style: const TextStyle(
                                color: ConstColors.primaryBlueColor,
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : const TextSpan(text: ""),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //show popup menu that have location detailes
                    },
                    child: Column(
                      children: [
                        ConstIcons.solidLocationIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'View Location',
                          style: GoogleFonts.roboto(
                            color: ConstColors.primaryBlueColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        ConstIcons.solidSharIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Share',
                          style: GoogleFonts.roboto(
                            color: ConstColors.primaryBlueColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        ConstIcons.solidSaveIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Save',
                          style: GoogleFonts.roboto(
                            color: ConstColors.primaryBlueColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        ConstIcons.solidCommentIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.postModel.comments.toString(),
                          style: GoogleFonts.roboto(
                            color: ConstColors.primaryBlueColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        ConstIcons.solidLoveGoldIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.postModel.likes.toString(),
                          style: GoogleFonts.roboto(
                            color: ConstColors.primaryBlueColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
