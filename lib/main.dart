import 'package:flutter/material.dart';
import 'package:islami_app/Screens/HomeScreen.dart';
import 'package:islami_app/Screens/Intro_screen.dart';
import 'package:islami_app/Screens/tabs/hadeth/Hadith_details.dart';
import 'package:islami_app/Screens/tabs/quruan/Sura_details.dart';
import 'package:islami_app/utilities/App_Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HomeScreenRoute,
      routes: {
        AppRoutes.HomeScreenRoute: (context) => Homescreen(),
        AppRoutes.IntroScreenRoute: (context) => IntroScreen(),
        AppRoutes.SuraDetailsRoute: (context) => SuraDetails(),
        AppRoutes.HadithDetailsRoute: (context) => HadithDetails(),
      },
    );
  }
}
