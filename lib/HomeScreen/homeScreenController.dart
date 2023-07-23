import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ok/HomePage/HomePage.dart';
import 'package:ok/Settings/Settings.dart';
import 'package:ok/favourite/FavouriteView.dart';
import 'package:ok/profile/profile_view.dart';
abstract class HomeScreenController extends GetxController{
  changePage(int currentPage);

}
class HomeScreenControllerImp extends HomeScreenController{
  int currentPage = 0;
  List<Widget>listPage=[
    const HomePage(),
    const FavouriteHome(),
    const Profile(),
    const Settings(),
  ];
  List bottomAppBar=[
    {
      "title":"Home",
      "icon":Icons.home
    },
    {
      "title":"Fav",
      "icon":Icons.favorite
    },
    {
      "title":"Profile",
      "icon":Icons.person
    },
    {
      "title":"Settings",
      "icon":Icons.settings
    },

  ];

  @override
  changePage(int i) {
    currentPage=i;
    update();
  }

}