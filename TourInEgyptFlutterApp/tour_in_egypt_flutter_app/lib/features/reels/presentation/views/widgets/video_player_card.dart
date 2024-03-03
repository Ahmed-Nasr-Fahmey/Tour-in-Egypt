import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/api_service.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/features/reels/presentation/views/widgets/reels_show_dialog.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCard extends StatefulWidget {
  const VideoPlayerCard({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<VideoPlayerCard> createState() => _VideoPlayerCardState();
}

class _VideoPlayerCardState extends State<VideoPlayerCard> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isPlaying = false;
  bool isPause = false;
  bool isLiked = false;
  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((value) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              onTap: () {
                if (_videoPlayerController.value.isPlaying) {
                  setState(() {
                    _videoPlayerController.pause();
                    isPlaying = true;
                    isPause = false;
                  });
                } else {
                  setState(() {
                    _videoPlayerController.play();
                    isPlaying = false;
                    isPause = true;
                  });
                }
              },
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                  ),
                  isPlaying
                      ? const ReelsShowDialog(
                          icon: Icons.pause,
                        )
                      : const SizedBox(),
                  isPause
                      ? const ReelsShowDialog(
                          icon: Icons.play_arrow,
                        )
                      : const SizedBox(),
                  isLiked
                      ? const ReelsShowDialog(
                          icon: Icons.favorite,
                        )
                      : const SizedBox(),
                  Positioned(
                    right: 16,
                    bottom: MediaQuery.of(context).size.height * 0.1,
                    child: Column(
                      children: [
                        ConstIcons.solidLoveGoldIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '120 K',
                          style: GoogleFonts.roboto(
                            color: ConstColors.backgroundLightMode,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ConstIcons.solidCommentIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '3 K',
                          style: GoogleFonts.roboto(
                            color: ConstColors.backgroundLightMode,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ConstIcons.solidSharIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Share',
                          style: GoogleFonts.roboto(
                            color: ConstColors.backgroundLightMode,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ConstIcons.solidSaveIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Save',
                          style: GoogleFonts.roboto(
                            color: ConstColors.backgroundLightMode,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ConstIcons.solidLocationIcon,
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Location',
                          style: GoogleFonts.roboto(
                            color: ConstColors.backgroundLightMode,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.12,
                    left: 16,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: ConstColors.primaryGoldColor,
                          radius: 20,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              ApiService.imagesBaseUrl +
                                  BlocProvider.of<UserCubit>(context)
                                      .userModel
                                      .picture!,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              BlocProvider.of<UserCubit>(context)
                                  .userModel
                                  .userName!,
                              style: GoogleFonts.roboto(
                                color: ConstColors.backgroundLightMode,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Sponsored',
                              style: GoogleFonts.roboto(
                                color: ConstColors.primaryGoldColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(
                          width: 10,
                          height: 10,
                          child: ConstIcons.solidCorrectIcon,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 50,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: ConstColors.primaryGoldColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Follow',
                              style: GoogleFonts.roboto(
                                color: ConstColors.backgroundLightMode,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.03,
                    right: 16,
                    left: 16,
                    child: const Text(
                      'Koshary is very tasty and I recommend it.Koshary is very tasty and I recommend it.\n\n#baile #musica #2022 #estilo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return ModalProgressHUD(
            color: Colors.black,
            opacity: 0.4,
            progressIndicator: const CircularProgressIndicator(
              color: ConstColors.primaryGoldColor,
              backgroundColor: ConstColors.primaryBlueColor,
            ),
            inAsyncCall: true,
            child: Container(
              color: ConstColors.primaryBlueColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
