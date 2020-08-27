import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;
  Result(this.score, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white70,
        ),
        height: MediaQuery.of(context).size.height * 0.5,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              score >= 30 ? 'assets/trophy.png' : 'assets/loser.png',
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              score >= 30 ? "Congrats !" : "Sorry !",
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'Your Score is ' + score.toString(),
              style: TextStyle(
                fontSize: 36,
                color: score >= 30 ? Colors.green[900] : Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                ),
                child: Text(
                  "Reset Quiz",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                padding: EdgeInsets.all(10),
              ),
              onTap: resetQuiz,
            )
          ],
        ),
      ),
    );
  }
}
