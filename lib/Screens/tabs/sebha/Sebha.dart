import 'package:flutter/material.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_Strings.dart';
import 'package:islami_app/utilities/App_styles.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double Turns = 0;
  int count = 1;
  String Doaa = AppStrings.SebhaDoaa1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            spacing: 10,
            children: [
          Text(
                AppStrings.SebhaTitle,
                style: AppStyles.white36bold,
                textAlign: TextAlign.center,
              ),
              Image.asset(AppImages.Sebhahead),
              GestureDetector(
                onTap: () {
                  count++;
                  if (count > 33 && count < 67)
                    Doaa = AppStrings.SebhaDoaa2;
                  else if (count > 66 && count < 100)
                    Doaa = AppStrings.SebhaDoaa3;
                  else if (count == 100) {
                    count = 1;
                    Doaa = AppStrings.SebhaDoaa1;
                  }
                  setState(() {
                    Turns += 0.03;
                  });
                },
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    AnimatedRotation(
                      turns: Turns,
                      duration: const Duration(milliseconds: 50),
                      child: Image.asset(AppImages.SebhaBody),
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        Text(Doaa, style: AppStyles.white36bold),
                        Text("$count", style: AppStyles.white36bold),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
