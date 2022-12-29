import 'package:flutter/material.dart';
import '../main.dart';
import 'MenuItems.dart';

var currentPage = DrawerSections.home;

Widget MenuSportsList() {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      //Show the list of menu drawer
      children: [
        menuItems(1, "Home", Icons.home_outlined,
            currentPage == DrawerSections.home ? true : false),
        menuItems(2, "Basketball", Icons.sports_basketball_outlined,
            currentPage == DrawerSections.basketball ? true : false),
        menuItems(3, "Volleyball", Icons.sports_volleyball_outlined,
            currentPage == DrawerSections.volleyball ? true : false),
        menuItems(4, "Football", Icons.sports_soccer_outlined,
            currentPage == DrawerSections.football ? true : false),
      ],
    ),
  );
}
