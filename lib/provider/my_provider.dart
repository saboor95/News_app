import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  List<String> items1 = ['English,Arabic'];
  String dropdownValue1 = 'English';
  String get selected1 => dropdownValue1;

  void setSelectedItemLanguage(String s) {
    dropdownValue1 = s;
    notifyListeners();
  }
  void changeLanguage(String lang) {
    languageCode = lang;
    notifyListeners();
  }
}