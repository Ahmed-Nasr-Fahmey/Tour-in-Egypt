// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:gp_tour_in_egypt/core/constants/icon_const.dart';

// import '../../features/Home/home_view.dart';
// import '../../features/Like/like_view.dart';
// import '../../features/Profile/profile_view.dart';
// import '../../features/Reel/reels_view.dart';
// import '../../features/Search/search_view.dart';
// import '../constants/colors_const.dart';

// class BottomNavigatorBar extends StatefulWidget {
//   const BottomNavigatorBar({super.key});
//   static const String routeName = 'BottomNavigatorBar';
//   @override
//   State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
// }

// class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
//   final List<Widget> mainScreensList = const [
// HomeView(),
// SearchView(),
// ReelsView(),
// LikesView(),
// ProfileView(),
//   ];

//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true, // to make buttom nav bar transparent
//       body: mainScreensList.elementAt(currentIndex),
//       bottomNavigationBar: CurvedNavigationBar(
//         color: ConstColors.primaryBlueColor,
//         backgroundColor: Colors.transparent,
//         height: 60,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 500),
//         items: [
//           const Padding(
//             padding: EdgeInsets.all(8),
//             child: Center(child: ConstIcons.solidHomeIcon),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: ConstIcons.solidSearchIcon,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ConstIcons.solidReelsIcon,
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: ConstIcons.solidLoveIcon,
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: ConstIcons.solidProfileIcon,
//           ),
//         ],
//         index: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:tour_in_egypt_flutter_app/constants.dart';
// import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/home_view.dart';
// import 'package:tour_in_egypt_flutter_app/features/likes/presentation/views/like_view.dart';
// import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/profile_view.dart';
// import 'package:tour_in_egypt_flutter_app/features/reels/presentation/views/reels_view.dart';
// import 'package:tour_in_egypt_flutter_app/features/search/presentation/views/search_view.dart';

// BuildContext? testContext;

// class BottomNavigatorBar extends StatefulWidget {
//   const BottomNavigatorBar({super.key});
//   static const String routeName = 'BottomNavigatorBar';
//   @override
//   State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
// }

// class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
//   late PersistentTabController _controller;
//   List<Widget> buildScreens = [
// const HomeView(),
// const SearchView(),
// const ReelsView(),
// const LikesView(),
// const ProfileView(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView.custom(
//       context,
//       onWillPop: (context) async {
//         SystemNavigator.pop();
//         return false;
//       },
//       selectedTabScreenContext: (context) {
//         testContext = context;
//       },
//       resizeToAvoidBottomInset: true,
//       hideNavigationBarWhenKeyboardShows: true,
//       backgroundColor: Colors.transparent,
//       bottomScreenMargin: 0,
//       routeAndNavigatorSettings: const CustomWidgetRouteAndNavigatorSettings(
//         initialRoute: HomeView.routeName,
//         // onGenerateRoute: Routes.generateRoute,
//       ),
//       controller: _controller,
//       itemCount: buildScreens.length,
//       screens: buildScreens,
//       customWidget: CurvedNavigationBar(
//         color: const Color(0XFF005A9E),
//         backgroundColor: Colors.transparent,
//         height: 60,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 500),
//         onTap: (index) {
//           setState(() {
//             _controller.index = index;
//           });
//           if (testContext != null) {
//             setState(() {});
//           }
//         },
//         index: _controller.index,
//         items: [
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Center(
//                 child: _controller.index == 0
// ? ConstIcons.solidHomeGoldIcon
//                     : ConstIcons.solidHomeWhiteIcon),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: _controller.index == 1
// ? ConstIcons.solidSearchGoldIcon
// : ConstIcons.solidSearchWhiteIcon,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: _controller.index == 2
// ? ConstIcons.solidReelsGoldIcon
//                 : ConstIcons.solidReelsWhiteIcon,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: _controller.index == 3
// ? ConstIcons.solidLoveGoldIcon
//                 : ConstIcons.solidLoveWhiteIcon,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: _controller.index == 4
// ? ConstIcons.solidProfileGoldIcon
//                 : ConstIcons.solidProfileWhiteIcon,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/features/home/presentation/views/home_view.dart';
import 'package:tour_in_egypt_flutter_app/features/likes/presentation/views/like_view.dart';
import 'package:tour_in_egypt_flutter_app/features/profile/presentation/views/profile_view.dart';
import 'package:tour_in_egypt_flutter_app/features/reels/presentation/views/reels_view.dart';
import 'package:tour_in_egypt_flutter_app/features/search/presentation/views/search_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  static const routeName = 'CustomBottomNavigationBar';
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  PersistentTabController? _controller;
  bool reelsIsSelected = false;
  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const SearchView(),
      const ReelsView(),
      const LikesView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Center(
          child: FaIcon(
            FontAwesomeIcons.house,
            size: 20,
          ),
        ),
        title: "Home",
        activeColorPrimary: ConstColors.primaryGoldColor,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Center(
          child: FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
          ),
        ),
        title: "Search",
        activeColorPrimary: ConstColors.primaryGoldColor,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/onboardImages/Reels icon.svg',
          // ignore: deprecated_member_use
          color: reelsIsSelected
              ? ConstColors.primaryGoldColor
              : CupertinoColors.white,
          height: 20,
        ),
        title: "Reels",
        activeColorPrimary: ConstColors.primaryGoldColor,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Center(
          child: FaIcon(
            FontAwesomeIcons.solidHeart,
            size: 20,
          ),
        ),
        title: "Likes",
        activeColorPrimary: ConstColors.primaryGoldColor,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Center(
          child: FaIcon(
            FontAwesomeIcons.solidUser,
            size: 20,
          ),
        ),
        title: "Profile",
        activeColorPrimary: ConstColors.primaryGoldColor,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,

      padding: const NavBarPadding.all(0),
      navBarHeight: 55,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      onItemSelected: (value) {
        if (value == 2) {
          setState(() {
            reelsIsSelected = true;
          });
        } else {
          setState(() {
            reelsIsSelected = false;
          });
        }
      },
      backgroundColor: ConstColors.primaryBlueColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        colorBehindNavBar: Colors.transparent,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: false,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }
}
