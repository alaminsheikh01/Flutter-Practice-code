import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String answerIndex;

  Question(this.answerIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Text(
        answerIndex,
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }
}
