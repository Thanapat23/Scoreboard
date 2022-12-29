import 'package:flutter/material.dart';

class Basketball extends StatefulWidget {
  @override
  _BasketballState createState() => _BasketballState();
}

class _BasketballState extends State<Basketball> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ScoreBoard Basketball"),
      ),
    );
  }
}
