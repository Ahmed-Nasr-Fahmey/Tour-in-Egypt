// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/core/models/post_model.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/functions/unfocus_textfield.dart';
import 'package:tour_in_egypt_flutter_app/core/utils/manager/user_cubit.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_main_app_bar.dart';
import 'package:tour_in_egypt_flutter_app/core/widgets/custom_profile_text_form_field.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/pick_location_view.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});
  static const String routName = 'ProfileView';

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  File? imageFile;
  String placeName = '';
  String content = '';
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context).postModel = PostModel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocusTextFieldsWhenClickOutSide(context),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Stack(
            children: [
              const CustomMainAppBar(
                title: 'Add Post',
                hasBackgroundColor: true,
                hasBackIcon: true,
              ),
              Positioned(
                right: 16,
                top: 34,
                child: GestureDetector(
                  onTap: () async {
                    if (BlocProvider.of<UserCubit>(context)
                            .postModel
                            .postFile !=
                        null) {
                      BlocProvider.of<UserCubit>(context)
                          .postModel
                          .contentType = 'Image';
                    } else {
                      BlocProvider.of<UserCubit>(context)
                          .postModel
                          .contentType = 'String';
                    }
                    BlocProvider.of<UserCubit>(context).postModel.placeName =
                        placeName;
                    // Split the content string based on '#'
                    List<String> parts = content.split('#');

                    // Extract description (first part)
                    String description = parts.first.trim();

                    // Extract hashtags (remaining parts)
                    List<String> hashtags = [];
                    if (parts.length > 1) {
                      for (int i = 1; i < parts.length; i++) {
                        // Add '#' back to the hashtag
                        String hashtag = '#${parts[i].trim()}';
                        hashtags.add(hashtag);
                      }
                    }
                    BlocProvider.of<UserCubit>(context).postModel.description =
                        description;
                    BlocProvider.of<UserCubit>(context).postModel.hashtags =
                        hashtags.isNotEmpty ? hashtags.join(' ') : '';

                    await BlocProvider.of<UserCubit>(context).createPost();
                    await BlocProvider.of<UserCubit>(context).getAllPosts();
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ConstColors.primaryBlueColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Publish',
                        style: GoogleFonts.roboto(
                          color: ConstColors.backgroundLightMode,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          imageFile!, // Adjust the height as needed
                          fit: BoxFit.cover,
                        ),
                      ) // Adjust the fit as needed
                    : const Icon(
                        Icons.image,
                        color: ConstColors.primaryBlueColor,
                        size: 40,
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: const RouteSettings(
                              name: PickLocationView.routeName),
                          screen: const PickLocationView(),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      icon: ConstIcons.solidLocationIcon,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        await _imgFromGallery(context);
                      },
                      icon: ConstIcons.solidImageIcon,
                    ),
                    IconButton(
                      onPressed: () async {
                        await _imgFromCamera(context);
                      },
                      icon: ConstIcons.solidCameraIcon,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ConstIcons.solidReelsGoldIcon,
                    )
                  ],
                ),
              ),
              CustomProfileTextFormField(
                hintText: 'Place Name',
                suffixIcon: null,
                validator: null,
                obscureText: false,
                isPassword: false,
                onChanged: (p0) {
                  placeName = p0;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomProfileTextFormField(
                hintText: 'Content',
                suffixIcon: null,
                validator: null,
                obscureText: false,
                isPassword: false,
                maxLines: 7,
                onChanged: (p0) {
                  content = p0;
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _imgFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path), context);
      }
    });
  }

  _imgFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path), context);
      }
    });
  }

  _cropImage(File imgFile, BuildContext context) async {
    if (imgFile.existsSync()) {
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: imgFile.absolute.path,
          aspectRatioPresets: Platform.isAndroid
              ? [
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio16x9
                ]
              : [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio5x3,
                  CropAspectRatioPreset.ratio5x4,
                  CropAspectRatioPreset.ratio7x5,
                  CropAspectRatioPreset.ratio16x9
                ],
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: "Crop Image",
              toolbarColor: ConstColors.primaryBlueColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              activeControlsWidgetColor: ConstColors.primaryBlueColor,
            ),
            IOSUiSettings(
              title: "Crop Image",
            )
          ]);
      if (croppedFile != null) {
        imageCache.clear();
        imageFile = File(croppedFile.path);
        BlocProvider.of<UserCubit>(context).postModel.postFile = imageFile;
        setState(() {});
        // reload();
      }
    }
  }
}
