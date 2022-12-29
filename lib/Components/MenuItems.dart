import 'package:flutter/material.dart';
import '../main.dart';

// var currentPage = DrawerSections.home;

Widget menuItems(int id, String title, IconData icon, bool seclected) {
  return Material(
    color: seclected ? Colors.grey[300] : Colors.transparent,
    child: InkWell(
      onTap: () {
        // Navigator.pop(context);
        // setState(() {
        //   if (id == 1) {
        //     currentPage = DrawerSections.home;
        //   } else if (id == 2) {
        //     currentPage = DrawerSections.basketball;
        //   } else if (id == 3) {
        //     currentPage = DrawerSections.volleyball;
        //   } else if (id == 4) {
        //     currentPage = DrawerSections.football;
        //   }
        // });
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
