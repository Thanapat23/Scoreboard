import 'package:flutter/material.dart';

class MenuSports extends StatefulWidget {
  const MenuSports({super.key});

  @override
  State<MenuSports> createState() => _MenuSportsState();
}

class _MenuSportsState extends State<MenuSports> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      width: double.infinity,
      height: 140,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('image/scoreboard.png'),
              ),
            ),
          ),
          Text(
            "ScoreBoard",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Sports List",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
