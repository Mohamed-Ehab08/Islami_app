import 'package:shared_preferences/shared_preferences.dart';

void LastSuraIndex(int SuraIndex) async {
  var SharedPref = await SharedPreferences.getInstance();
  List<String> MostRecent = SharedPref.getStringList('most_recent') ?? [];
  if (MostRecent.contains('$SuraIndex')) {
    MostRecent.remove('$SuraIndex');
  }
  if (MostRecent.length > 4) MostRecent.removeAt(0);
  MostRecent.add('$SuraIndex');
  SharedPref.setStringList('most_recent', MostRecent);
}
