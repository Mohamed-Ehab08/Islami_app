import 'package:flutter/material.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_lists.dart';
import 'package:islami_app/utilities/App_styles.dart';

class SuraWidget extends StatelessWidget {
  int index;

  SuraWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      spacing: width * 0.04,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppImages.Vector),
            Text('${index + 1}', style: AppStyles.White16bold),
          ],
        ),
        Column(
          spacing: height * 0.005,
          children: [
            Text(
              AppLists.englishQuranSurahs[index],
              style: AppStyles.White20bold,
            ),
            Text(
              AppLists.AyaNumber[index] + ' Verses',
              style: AppStyles.White20bold,
            ),
          ],
        ),
        Spacer(),
        Text(AppLists.arabicQuranSuras[index], style: AppStyles.White20bold),
      ],
    );
  }
}
