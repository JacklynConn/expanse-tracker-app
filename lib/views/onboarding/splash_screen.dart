import 'package:expanse_tracker/resources/app_styles.dart';

import '../../resources/app_routes.dart';
import '/resources/app_colours.dart';
import '/resources/app_strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.primaryColour,
      body: Center(
        child: Text(
          AppStrings.appName,
          style: AppStyles.titleX(size: 56, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    initApp();
    super.initState();
  }

  void initApp(){
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.walkthroughScreen);
    });
  }
}
