import 'dart:async';

import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatefulWidget {
  final List questions;
  final int questionIndex;
  final Function answerQuestion;
  Quiz({this.questions, this.questionIndex, this.answerQuestion});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  double _progressValue = 1.0;
  Timer _timer;

  @override
  void initState() {
    _updateProgress();
    super.initState();
  }

  void resetTimer() {
    setState(() {
      _progressValue = 1.0;
    });
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue -= 0.1;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '0.0') {
          if (widget.questionIndex == 4) {
            t.cancel();
          }
          _progressValue = 1.0;
          widget.answerQuestion(0);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Text(
            "QUIZ APP",
            style: TextStyle(
                fontSize: 34, color: Colors.amber, fontWeight: FontWeight.w800),
          ),
        ),
        Question(
          widget.questions[widget.questionIndex]['questionText'],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: LinearProgressIndicator(
            backgroundColor: Colors.amber,
            value: _progressValue,
          ),
        ),
        ...(widget.questions[widget.questionIndex]['answers'] as List<Map>)
            .asMap()
            .entries
            .map((answer) {
          return Answer(
              answer.value['text'],
              () => widget.answerQuestion(answer.value['score']),
              answer.key,
              resetTimer);
        }).toList()
      ],
    );
  }
}
