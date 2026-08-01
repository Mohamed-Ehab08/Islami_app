import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> MostRecentSuras = [];

  void ReadMostRecent() async {
    var SharedPref = await SharedPreferences.getInstance();
    List<String> MostRecent = SharedPref.getStringList('most_recent') ?? [];

    MostRecentSuras = MostRecent.map(
      (element) => int.parse(element),
    ).toList().reversed.toList();
    notifyListeners();
  }
}
