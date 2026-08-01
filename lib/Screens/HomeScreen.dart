import 'package:flutter/material.dart';
import 'package:islami_app/Screens/tabs/hadeth/Hadeth.dart';
import 'package:islami_app/Screens/tabs/quruan/Quran.dart';
import 'package:islami_app/Screens/tabs/radio/Radio.dart';
import 'package:islami_app/Screens/tabs/sebha/Sebha.dart';
import 'package:islami_app/Screens/tabs/time/Time.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> Tabs = [Quran(), Hadeth(), Sebha(), RadioTab(), Time()];
  List<String> Images = [AppImages.QuranBg, AppImages.QuranBg,
    AppImages.SebhaBg, AppImages.RadioBg, AppImages.QuranBg
  ];
  int selected_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Image.asset(Images[selected_index],
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Image.asset(AppImages.IslamiLogo),
                Expanded(child: Tabs[selected_index])
              ],
            ),
          )
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
        backgroundColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          selected_index = index;
          setState(() {

          });
        },
        items: [

          _buttom_navigation_bar(AppImages.QuranIcon, 'Quran', 0),
          _buttom_navigation_bar(AppImages.hadeethIcon, 'Hadeth', 1),
          _buttom_navigation_bar(AppImages.sebhaIcon, 'Sebha', 2),
          _buttom_navigation_bar(AppImages.radioIcon, 'Radio', 3),
          _buttom_navigation_bar(AppImages.timeIcon, 'Time', 4),

        ],
        selectedItemColor: AppColors.WhiteColor,
        unselectedItemColor: AppColors.bgColor,
        showUnselectedLabels: false,
      ),
    );
  }

  BottomNavigationBarItem _buttom_navigation_bar(String image, String label,
      int index) {
    return BottomNavigationBarItem
      (icon: index == selected_index ?
    Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.bgColoritem,
        ),
        child: ImageIcon(AssetImage(image))
    ) : ImageIcon(AssetImage(image)), label: label);
  }
}

