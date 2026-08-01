import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Screens/tabs/hadeth/hadeth_item.dart';

class Hadeth extends StatefulWidget {
  Hadeth({super.key});

  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {



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
    return CarouselSlider(

        items: List.generate(50, (index) => index + 1,).map((index) {
          return HadethItem(index: index - 1,);
        }

          ,).toList(),
        options: CarouselOptions(
          height: height * 0.7,
          enlargeCenterPage: true,
        )
    );
  }


}
