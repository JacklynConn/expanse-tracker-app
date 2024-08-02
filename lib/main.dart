import '/views/auth/signup_screen.dart';
import '/resources/app_routes.dart';
import '/views/onboarding/walkthrough_screen.dart';
import '/resources/app_colours.dart';
import '/resources/app_strings.dart';
import '/views/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColours.primaryColour),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      initialRoute: AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.walkthroughScreen: (context) => const WalkthroughScreen(),
        AppRoutes.signUpScreen: (context) => const SignupScreen(),
      },
    );
  }
}
