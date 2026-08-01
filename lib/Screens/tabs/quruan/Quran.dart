import 'package:flutter/material.dart';
import 'package:islami_app/Screens/tabs/quruan/Sura_widget.dart';
import 'package:islami_app/cache/shared_preference_utils.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_Routes.dart';
import 'package:islami_app/utilities/App_Strings.dart';
import 'package:islami_app/utilities/App_lists.dart';
import 'package:islami_app/utilities/App_styles.dart';

import 'most_recently.dart';

class Quran extends StatefulWidget {
  Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<int> FilterList = List.generate(113, (index) => index,);

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
              onChanged: (value) {
                return SearchBySuraName(value,);
              },

            ),
            SizedBox(height: height * 0.02,),
            MostRecently(),

            SizedBox(height: height * 0.02,),
            Text(AppStrings.SurasList, style: AppStyles.White16bold,),
            SizedBox(height: height * 0.01,),
            FilterList.isEmpty ? Center(
              child: Text("No Sura Found", style: AppStyles.gold20bold,),)
                : ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      LastSuraIndex(FilterList[index]);
                      Navigator.of(context).pushNamed(
                          AppRoutes.SuraDetailsRoute,
                          arguments: FilterList[index]);
                    },
                      child: SuraWidget(index: FilterList[index])
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
                itemCount: FilterList.length)
          ],
        ),
      ),
    );
  }

  void SearchBySuraName(String text) {
    List<int> SearchList = [];

    for (int i = 0; i < AppLists.AyaNumber.length; i++) {
      if (AppLists.englishQuranSurahs[i].toUpperCase().contains(
          text.toUpperCase())) {
        SearchList.add(i);
      }
      if (AppLists.arabicQuranSuras[i].toUpperCase().contains(
          text.toUpperCase())) {
        SearchList.add(i);
      }
      FilterList = SearchList;
      setState(() {

      });
    }
  }
}
