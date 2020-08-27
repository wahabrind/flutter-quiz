import "package:flutter/material.dart";
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  var _questionIndex = 0;
  var _score = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(int score) {
    _score += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    var _questions = [
      {
        "questionText":
            "Name the cricket player who has made first double century one day cricket Match?",
        "answers": [
          {'text': 'Tendulkar', 'score': 10},
          {'text': 'Ponting', 'score': 0},
          {'text': 'Lara', 'score': 0},
          {'text': 'Gangually', 'score': 0}
        ]
      },
      {
        "questionText": "Football World Cup 2010 won by",
        "answers": [
          {'text': 'France', 'score': 0},
          {'text': 'Spain', 'score': 10},
          {'text': 'Netherland', 'score': 0},
          {'text': 'Germany', 'score': 0}
        ]
      },
      {
        "questionText": "Asia Cricket Cup 2012 won by",
        "answers": [
          {'text': 'India', 'score': 0},
          {'text': 'Pakistan', 'score': 10},
          {'text': 'Bangladesh', 'score': 0},
          {'text': 'Sri lanka', 'score': 0}
        ]
      },
      {
        "questionText": "Which country has won first Cricket World Cup?",
        "answers": [
          {'text': 'West indies', 'score': 10},
          {'text': 'Australia', 'score': 0},
          {'text': 'India', 'score': 0},
          {'text': 'England', 'score': 0}
        ]
      },
      {
        "questionText": "In Hockey how many players each team has?",
        "answers": [
          {'text': '9', 'score': 0},
          {'text': '10', 'score': 0},
          {'text': '11', 'score': 10},
          {'text': '12', 'score': 0}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(44, 64, 88, 1),
        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(44, 64, 88, 1),
        //   title: Text(
        //     "Quiz App",
        //   ),
        // ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_score, _resetQuiz),
      ),
    );
  }
}
