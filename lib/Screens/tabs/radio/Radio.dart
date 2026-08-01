import 'package:flutter/material.dart';
import 'package:islami_app/Screens/widgets/CustomContainer.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Strings.dart';
import 'package:segmented_button_slide/segmented_button_slide.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});


  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List<Customcontainer> Radios = [
    Customcontainer(Text: AppStrings.Radio1),
    Customcontainer(Text: AppStrings.Radio1),
    Customcontainer(Text: AppStrings.Radio1),
    Customcontainer(Text: AppStrings.Radio1),
    Customcontainer(Text: AppStrings.Radio1)
  ];
  List<Customcontainer> Reciters = [
    Customcontainer(Text: AppStrings.Radio2),
    Customcontainer(Text: AppStrings.Radio2),
    Customcontainer(Text: AppStrings.Radio2),
    Customcontainer(Text: AppStrings.Radio2),
    Customcontainer(Text: AppStrings.Radio2)
  ];
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //spacing: 10,
              children: [


                SegmentedButtonSlide(
                  entries: const [
                    SegmentedButtonSlideEntry(

                      label: "Radio",
                    ),
                    SegmentedButtonSlideEntry(

                      label: "Reciters",
                    ),

                  ],
                  selectedEntry: _selected,

                  onChange: (selected) => setState(() => _selected = selected),
                  colors: SegmentedButtonSlideColors(
                    barColor: AppColors.bgColoritem,
                    backgroundSelectedColor:
                    AppColors.primaryColor,
                  ),

                  //margin: const EdgeInsets.all(16),
                  height: 30,
                  padding: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(12),
                  selectedTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.bgColor,
                  ),
                  unselectedTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.WhiteColor,
                  ),


                ),

                if (_selected == 0) ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Radios[index],
                  itemCount: Radios.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 15,);
                  },
                )
                else
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Reciters[index],
                    itemCount: Reciters.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 15,);
                    },
                  ),

              ],
            ),
          ),
        );
  }
}
