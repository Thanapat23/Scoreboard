import 'package:flutter/material.dart';

class Football extends StatefulWidget {
  @override
  _FootballState createState() => _FootballState();
}

class _FootballState extends State<Football> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ScoreBoard Football"),
      ),
    );
  }
}
