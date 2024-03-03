import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_in_egypt_flutter_app/core/models/catigory_model.dart';

class ConstColors {
  static const Color primaryGoldColor = Color(0XFFFFA841);
  static const Color primaryBlueColor = Color(0XFF005A9E);
  static const Color backgroundLightMode = Color(0XFFEFF8FF);
  static const Color backgroundDarkMode = Color(0XFF1D1D1D);
  static const Color textFieldBackgroundColor = Color(0xFF303030);
  static const Color onBoardingIconsAndHintColor = Color(0xFF979797);
  static const Color profileTextColor = Color(0XFF6397BE);
  static const Color profileFilledTextField = Color(0XFFC5D3DD);

  static List<Color> grediantBackgroundColors = [
    Colors.black.withOpacity(0.2),
    Colors.black
  ];
}

class ConstIcons {
  static const String googleIconPath = 'assets/onboardImages/GoogleIcon.png';
  static const String facebookIconPath =
      'assets/onboardImages/FacebookIcon.png';
  static const String appleIconPath = 'assets/onboardImages/AppleIcon.png';
  static const String backgroundImage =
      'assets/onboardImages/Splash Screen.png';
  static const String starNotFilled = 'assets/Star_not_filled.png';
  static const String starFilled = 'assets/Star_filled.png';
  static const String subtract = 'assets/Subtract.png';
  static const String filter = 'assets/Filter_alt_fill.png';

  static const Widget googleIcon = FaIcon(
    FontAwesomeIcons.google,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget userNameIcon = FaIcon(
    FontAwesomeIcons.userLarge,
    size: 18,
    color: ConstColors.onBoardingIconsAndHintColor,
  );
  static const Widget emailIcon = FaIcon(
    FontAwesomeIcons.solidEnvelope,
    size: 18,
    color: ConstColors.onBoardingIconsAndHintColor,
  );
  static const Widget solidEyeIcon = FaIcon(
    FontAwesomeIcons.solidEye,
    size: 18,
    color: ConstColors.onBoardingIconsAndHintColor,
  );
  static const Widget solidEyeSlashIcon = FaIcon(
    FontAwesomeIcons.solidEyeSlash,
    size: 18,
    color: ConstColors.onBoardingIconsAndHintColor,
  );
  static const Widget solidMicrophoneIcon = FaIcon(
    FontAwesomeIcons.microphone,
    size: 20,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidNotificationsIcon = FaIcon(
    FontAwesomeIcons.solidBell,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidSetteingsIcon = FaIcon(
    FontAwesomeIcons.gear,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidLocationIcon = FaIcon(
    FontAwesomeIcons.locationDot,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidPlusIcon = FaIcon(
    FontAwesomeIcons.circlePlus,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidCorrectIcon = FaIcon(
    FontAwesomeIcons.solidCircleCheck,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidFollowIcon = FaIcon(
    FontAwesomeIcons.userPlus,
    size: 14,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidLoveGoldIcon = FaIcon(
    FontAwesomeIcons.solidHeart,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidLoveWhiteIcon = FaIcon(
    FontAwesomeIcons.solidHeart,
    size: 18,
    color: ConstColors.backgroundLightMode,
  );
  static const Widget solidCommentIcon = FaIcon(
    FontAwesomeIcons.solidCommentDots,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidSaveIcon = FaIcon(
    FontAwesomeIcons.solidBookmark,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidSharIcon = FaIcon(
    FontAwesomeIcons.share,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidBakeIcon = FaIcon(
    FontAwesomeIcons.angleLeft,
    size: 24,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidHomeGoldIcon = FaIcon(
    FontAwesomeIcons.house,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidHomeWhiteIcon = FaIcon(
    FontAwesomeIcons.house,
    size: 18,
    color: ConstColors.backgroundLightMode,
  );
  static const Widget solidSearchGoldIcon = FaIcon(
    FontAwesomeIcons.magnifyingGlass,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidSearchWhiteIcon = FaIcon(
    FontAwesomeIcons.magnifyingGlass,
    size: 18,
    color: ConstColors.backgroundLightMode,
  );
  static const Widget solidProfileGoldIcon = FaIcon(
    FontAwesomeIcons.solidUser,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidProfileWhiteIcon = FaIcon(
    FontAwesomeIcons.solidUser,
    size: 18,
    color: ConstColors.backgroundLightMode,
  );
  static const Widget solidStarIcon = FaIcon(
    FontAwesomeIcons.solidStar,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidFilterIcon = FaIcon(
    FontAwesomeIcons.filter,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidMyLocationIcon = FaIcon(
    FontAwesomeIcons.locationCrosshairs,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidUberIcon = FaIcon(
    FontAwesomeIcons.car,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidSendCommentIcon = FaIcon(
    FontAwesomeIcons.solidPaperPlane,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidImageIcon = FaIcon(
    FontAwesomeIcons.solidImage,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidCameraIcon = FaIcon(
    FontAwesomeIcons.camera,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidLanguagesIcon = FaIcon(
    FontAwesomeIcons.globe,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidMoodIcon = FaIcon(
    FontAwesomeIcons.solidMoon,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget solidAccessibilityIcon = FaIcon(
    FontAwesomeIcons.universalAccess,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static const Widget ellipsisIcon = FaIcon(
    FontAwesomeIcons.ellipsis,
    size: 18,
    color: ConstColors.primaryGoldColor,
  );
  static Widget solidReelsGoldIcon = SvgPicture.asset(
    'assets/onboardImages/Reels icon.svg',
    // ignore: deprecated_member_use
    color: ConstColors.primaryGoldColor,
    height: 20,
  );
  static Widget solidReelsWhiteIcon = SvgPicture.asset(
    'assets/onboardImages/Reels icon.svg',
    // ignore: deprecated_member_use
    color: ConstColors.backgroundLightMode,
    height: 20,
  );
}

class ConstImages {
  static const String logo = "assets/onboardImages/Logo.png";
}

class ConstLists {
  static List<CategoryModel> categoriesList = [
    CategoryModel(
        categoryName: 'Restaurants',
        categoryImageUrl: 'assets/Categories/Resturants.jpeg'),
    CategoryModel(
        categoryName: 'Cafes', categoryImageUrl: 'assets/Categories/Cafes.png'),
    CategoryModel(
        categoryName: 'Tourism',
        categoryImageUrl: 'assets/Categories/Tourism.jpg'),
    CategoryModel(
        categoryName: 'Beaches',
        categoryImageUrl: 'assets/Categories/Beaches.jpg'),
    CategoryModel(
        categoryName: 'Shopping',
        categoryImageUrl: 'assets/Categories/Shopping.jpg'),
    CategoryModel(
        categoryName: 'Parks', categoryImageUrl: 'assets/Categories/Parks.jpg'),
    CategoryModel(
        categoryName: 'Events',
        categoryImageUrl: 'assets/Categories/Events.jpg'),
    CategoryModel(
        categoryName: 'Emergency',
        categoryImageUrl: 'assets/Categories/Emergency.jpg'),
  ];
}
