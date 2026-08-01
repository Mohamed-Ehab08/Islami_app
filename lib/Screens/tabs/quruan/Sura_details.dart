import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_lists.dart';
import 'package:islami_app/utilities/App_styles.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  String verses2 = '';
  bool type = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int count = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty && verses2.isEmpty) LoadSura(count);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(
          AppLists.englishQuranSurahs[count],
          style: AppStyles.gold20bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              type = !type;
              setState(() {
                LoadSura(count);
              });
            },
            icon: Icon(
              Icons.swipe_down_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        ],
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
                Text(
                  AppLists.arabicQuranSuras[count],
                  style: AppStyles.gold24bold,
                ),
                Image.asset(AppImages.SursRightDec),
              ],
            ),
          ),
          Expanded(
            child: verses.isEmpty && verses2.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : type == true
                ? ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: BoxBorder.all(
                          color: AppColors.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        verses[index] + '[${index + 1}]',
                        style: AppStyles.gold20bold,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * 0.02),
                    itemCount: verses.length,
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      verses2,
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

  void LoadSura(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/Suras/${index + 1}.txt',
    );
    List<String> fileSplit = fileContent.split('\n');
    if (type == true) {
      verses = fileSplit;
      print(verses);
    } else {
      for (int i = 0; i < fileSplit.length; i++) {
        fileSplit[i] += '[${i + 1}]';
      }
      verses2 = fileSplit.join(' ');
      print(verses2);
    }
    setState(() {});
  }
}
