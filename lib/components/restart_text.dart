import 'package:first_game_yt_tuto/game_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReStartText {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  ReStartText(this.gameController) {
    painter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    painter.text = TextSpan(
      text: 'Press to restart',
      style: TextStyle(
        color: Colors.black,
        fontSize: 50.0,
      ),
    );
    painter.layout();

    position = Offset(
        (gameController.screenSize.width / 2) - (painter.width / 2),
        (gameController.screenSize.height * 0.7) - (painter.height / 2));
  }
}
