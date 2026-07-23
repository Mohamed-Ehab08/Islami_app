import 'package:flutter/material.dart';
import 'package:islami_app/utilities/App_Colors.dart';
import 'package:islami_app/utilities/App_Images.dart';
import 'package:islami_app/utilities/App_styles.dart';

class Customcontainer extends StatelessWidget {
  String _Text;

  Customcontainer({super.key, required this._Text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Image.asset(AppImages.ContRadioBg),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(_Text, style: AppStyles.black20bold),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow, size: 50),
                    Icon(Icons.volume_down, size: 50),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
