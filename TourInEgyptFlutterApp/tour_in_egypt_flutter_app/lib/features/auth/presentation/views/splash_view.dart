import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_in_egypt_flutter_app/constants.dart';
import 'package:tour_in_egypt_flutter_app/features/auth/presentation/views/log_in_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = "SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return const LogInView();
          },
        ),
        (_) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ConstIcons.backgroundImage),
        ),
      ),
      width: screenWidth,
      height: screenHeight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.55,
              ),
              const Image(
                image: AssetImage(ConstImages.logo),
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
