import 'package:flutter/material.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_styles.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.IslamiLogo),

            Expanded(
              child: Column(
                spacing: 50,
                children: [
                  Image.asset(AppImages.Intro1Logo),

                  Text('Welcome to Islami app', style: AppStyles.gold24bold),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
