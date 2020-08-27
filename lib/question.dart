import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questions;

  Question(this.questions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questions,
        style: TextStyle(fontSize: 28, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
