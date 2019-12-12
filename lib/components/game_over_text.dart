import 'package:first_game_yt_tuto/game_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameOverText{
  final GameController gameController;
  TextPainter painter;
  Offset position;
  int finalScore;

  GameOverText(this.gameController) {
    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    finalScore = gameController.score;
    painter.text = TextSpan(
      text: 'Your score : $finalScore',
      style: TextStyle(
        color: Colors.black,
        fontSize: 50.0,
      ),
    );
    painter.layout();

    position = Offset(
        (gameController.screenSize.width / 2) - (painter.width / 2),
        (gameController.screenSize.height * 0.2) - (painter.height / 2));

  }
}
