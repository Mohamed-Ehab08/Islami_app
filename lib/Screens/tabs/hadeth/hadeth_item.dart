import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Routes.dart';

import '../../../utilities/App_Images.dart';
import '../../../utilities/App_styles.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  // HadithDetails Hadith;
  String HadithTitle = '';
  String HadithContent = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (HadithTitle.isEmpty) LoadHadith(widget.index);

    return HadithTitle.isEmpty
        ? Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          )
        : InkWell(
            onTap: () => Navigator.of(
              context,
            ).pushNamed(AppRoutes.HadithDetailsRoute, arguments: widget.index),
            child: Container(
              margin: EdgeInsetsGeometry.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryColor,
              ),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppImages.SursLeftDec,
                          color: AppColors.bgColor,
                        ),
                        Expanded(
                          child: Text(
                            HadithTitle,
                            style: AppStyles.black24bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Image.asset(
                          AppImages.SursRightDec,
                          color: AppColors.bgColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SingleChildScrollView(
                        child: Text(
                          HadithContent,
                          style: AppStyles.black16bold,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    AppImages.SursBottomDec,
                    color: AppColors.bgColor,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          );
    ;
  }

  void LoadHadith(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/Hadeeth/h${index + 1}.txt',
    );
    List<String> fileSplit = fileContent.split('\n');
    HadithTitle = fileSplit[0];
    fileSplit.removeAt(0);
    HadithContent = fileSplit.join(' ');
    //Hadeeth.add(HadithDetails(Title: HadithTitle, Content: HadithContent));

    setState(() {});
  }
}
