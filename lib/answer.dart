import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function handler;
  final Function resetTimer;
  final int index;
  Answer(this.answerText, this.handler, this.index, this.resetTimer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: InkWell(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 5),
          color: Color.fromRGBO(203, 220, 230, 1),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.amber,
              child: Text(
                (index + 1).toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            title: Text(
              answerText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        onTap: () {
          resetTimer();
          handler();
        },
      ),
    );
  }
}
