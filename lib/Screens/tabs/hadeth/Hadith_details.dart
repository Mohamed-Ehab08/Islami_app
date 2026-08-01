import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_styles.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  String HadithTitle = '';
  String HadithContent = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int count = ModalRoute.of(context)?.settings.arguments as int;
    if (HadithTitle.isEmpty) LoadHadith(count);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text('Hadith ${count + 1}', style: AppStyles.gold20bold),
        centerTitle: true,
      ),
      body: Column(
        spacing: height * 0.01,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.SursLeftDec),
                Expanded(
                  child: Text(
                    HadithTitle,
                    style: AppStyles.gold24bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppImages.SursRightDec),
              ],
            ),
          ),
          Expanded(
            child: HadithTitle.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      HadithContent,
                      style: AppStyles.gold20bold,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
          ),

          Image.asset(
            AppImages.SursBottomDec,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ],
      ),
    );
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
