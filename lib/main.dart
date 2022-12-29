// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard/Components/IntroSplashScreen.dart';
import 'package:scoreboard/Components/MenuSports.dart';
// import 'package:scoreboard/Components/MenuSportsList.dart';
// import 'package:scoreboard/Components/MenuItems.dart';

import 'Components/Home.dart';
import 'Components/Basketball.dart';
import 'Components/Volleyball.dart';
import 'Components/Football.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ScoreBoard",
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = Home();
    } else if (currentPage == DrawerSections.basketball) {
      container = Basketball();
    } else if (currentPage == DrawerSections.volleyball) {
      container = Volleyball();
    } else if (currentPage == DrawerSections.football) {
      container = Football();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScoreBoard DEMO"),
      ),
      body: container,
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MenuSports(),
                MenuSportsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget menuItems(int id, String title, IconData icon, bool seclected) {
    return Material(
      color: seclected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.basketball;
            } else if (id == 3) {
              currentPage = DrawerSections.volleyball;
            } else if (id == 4) {
              currentPage = DrawerSections.football;
            }
          });
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
}

enum DrawerSections {
  home,
  basketball,
  volleyball,
  football,
}
