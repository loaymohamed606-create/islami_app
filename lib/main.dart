import 'package:flutter/material.dart';
import 'package:islami/core/utils/routes.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'package:islami/ui/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onboardingRoute,
      routes: {
        Routes.onboardingRoute: (context) => const OnboardingScreen(),
        Routes.homeRoute: (context) => const HomeScreen(),
      },
    );
  }
}