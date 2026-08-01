import 'package:flutter/material.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_Routes.dart';
import 'package:islami_app/utilities/App_Strings.dart';
import 'package:islami_app/utilities/App_lists.dart';
import 'package:islami_app/utilities/App_styles.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: [

            TextField(
              decoration: InputDecoration(
                  fillColor: AppColors.black70Color,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2
                      )
                  ),
                  prefixIcon: ImageIcon(AssetImage(AppImages.QuranIcon),
                    color: AppColors.primaryColor,),
                  hintText: AppStrings.SuraName,
                  hintStyle: AppStyles.White16bold

              ),
              cursorColor: AppColors.primaryColor,
              style: AppStyles.White16bold,

            ),
            SizedBox(height: height * 0.02,),
            Text(AppStrings.Recently, style: AppStyles.White16bold,),
            SizedBox(height: height * 0.01,),
            Container(

              width: width * 0.8,
              height: height * 0.2,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryColor,


              ),
              child: Row(
                spacing: 6,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Al-Anbiya', style: AppStyles.black24bold,),
                        Text('الأنبياء', style: AppStyles.black24bold,),
                        Text('112 verses', style: AppStyles.black14bold,),
                      ],
                    ),
                  ),
                  Expanded(child: Image.asset(AppImages.RecentBg))
                ],
              ),
            ),
            SizedBox(height: height * 0.02,),
            Text(AppStrings.SurasList, style: AppStyles.White16bold,),
            SizedBox(height: height * 0.01,),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          AppRoutes.SuraDetailsRoute, arguments: index);
                    },
                    child: Row(
                      spacing: width * 0.04,
                      children: [
                        Stack(
                          alignment: AlignmentGeometry.center,
                          children: [
                            Image.asset(AppImages.Vector),
                            Text('${index + 1}', style: AppStyles.White16bold,)
                          ],
                        ),
                        Column(
                          spacing: height * 0.005,
                          children: [
                            Text(AppLists.englishQuranSurahs[index],
                              style: AppStyles.White20bold,),
                            Text(AppLists.AyaNumber[index] + ' Verses',
                              style: AppStyles.White20bold,)
                          ],
                        ),
                        Spacer(),
                        Text(AppLists.arabicQuranSuras[index],
                          style: AppStyles.White20bold,)
                      ],
                    ),
                  );
                }
                ,
                separatorBuilder: (context, index) =>
                    SizedBox(
                      height: height * 0.04,
                      child: Divider(color: AppColors.WhiteColor,
                        thickness: 2,
                        indent: width * 0.04,
                        endIndent: width * 0.04,
                      ),
                    ),
                itemCount: 114)
          ],
        ),
      ),
    );
  }
}
