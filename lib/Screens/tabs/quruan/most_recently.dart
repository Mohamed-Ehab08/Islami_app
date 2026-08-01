import 'package:flutter/material.dart';
import 'package:islami_app/Providers/Most_Recent_provider.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_lists.dart';
import 'package:islami_app/utilities/App_styles.dart';
import 'package:provider/provider.dart';

import '../../../utilities/App_Strings.dart';

class MostRecently extends StatefulWidget {
  MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  late var mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.ReadMostRecent();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.MostRecentSuras.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.01,
        children: [
          Text(AppStrings.Recently, style: AppStyles.White16bold),
          SizedBox(
            width: width * 0.9,
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
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
                          Text(
                            AppLists.englishQuranSurahs[mostRecentProvider
                                .MostRecentSuras[index]],
                            style: AppStyles.black24bold,
                          ),
                          Text(
                            AppLists.arabicQuranSuras[mostRecentProvider
                                .MostRecentSuras[index]],
                            style: AppStyles.black24bold,
                          ),
                          Text(
                            '${AppLists.AyaNumber[mostRecentProvider.MostRecentSuras[index]]} verses',
                            style: AppStyles.black14bold,
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Image.asset(AppImages.RecentBg)),
                  ],
                ),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: mostRecentProvider.MostRecentSuras.length,
            ),
          ),
        ],
      ),
    );
  }
}
