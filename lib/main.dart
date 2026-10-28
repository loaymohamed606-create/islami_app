import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'core/utils/routes.dart';
import 'core/utils/colors.dart';
    

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override  
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.homeroute,
      routes: {
        Routes.homeroute: (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
