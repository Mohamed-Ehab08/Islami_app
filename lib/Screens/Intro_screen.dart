import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_Routes.dart';
import 'package:islami_app/utilities/App_styles.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: AppStyles.gold24bold,
      bodyTextStyle: AppStyles.gold24bold,
      //bodyPadding: EdgeInsets.only(top: 80),
      //imagePadding: EdgeInsets.only(top: 200),
      imageFlex: 4,
      pageColor: Colors.transparent,


      //contentMargin: EdgeInsets.only(top: 50)
      //contentMargin: EdgeInsets.only(top: 100)
      //imagePadding: EdgeInsets.all(value),
    );

    return IntroductionScreen(

      globalBackgroundColor: AppColors.bgColor,
      allowImplicitScrolling: true,


      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Image.asset(AppImages.IslamiLogo, fit: BoxFit.contain,),
        ),
      ),


      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Finish',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.HomeScreenRoute),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: Image.asset(AppImages.Intro1Logo,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islmi App",
          body:
          "We Are Very Excited To Have You In Our Community",
          image: Image.asset(AppImages.Intro2Logo),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body:
          "Read, and your Lord is the Most Generous",
          image: Image.asset(AppImages.Intro3Logo),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body:
          "Praise the name of your Lord, the Most High",
          image: Image.asset(AppImages.Intro4Logo),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body: "You can listen to the Holy Quran Radio through the application for free and easily",
          image: Image.asset(AppImages.Intro5Logo),
          decoration: pageDecoration,
        ),

      ],
      onDone: () =>
          Navigator.of(context).pushReplacementNamed(AppRoutes.HomeScreenRoute),
      onSkip: () =>
          Navigator.of(context).pushReplacementNamed(AppRoutes.HomeScreenRoute),
      // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text('Back', style: AppStyles.gold16bold),
      //skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Text('Next', style: AppStyles.gold16bold,),
      done: const Text('Finish', style: AppStyles.gold16bold,),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.primaryColor,
        color: AppColors.lightGreyColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

      dotsContainerDecorator: const ShapeDecoration(
        color: AppColors.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
