import 'package:flutter/material.dart';

enum FavoriteFoods { pizza, steak, fries, risotto, burger }

class ProfileModel extends ChangeNotifier {
  String profilePhotoPath = "";
  String name = "";
  String email = "";
  int mobile = 0;
  FavoriteFoods favoriteFood = FavoriteFoods.pizza;

  bool get hasProfile => (!(profilePhotoPath == "") || !(name == "") || !(email == "") || !(mobile == 0));

  void savePhoto(String photoPath) {
    profilePhotoPath = photoPath;
    notifyListeners();
  }

  void saveDetails(String detailsName, String detailsEmail, int detailsMobile) {
    name = detailsName;
    email = detailsEmail;
    mobile = detailsMobile;
    notifyListeners();
  }

  void savePreferences(FavoriteFoods food) {
    favoriteFood = food;
    notifyListeners();
  }
}
