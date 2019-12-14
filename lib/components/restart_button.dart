import 'package:first_game_yt_tuto/game_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestartButton {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  RestartButton(this.gameController) {
    Container(child: (Text('Press to restart')));
    //onPressed: print('pressed'),)
    position = Offset(
        (gameController.screenSize.width / 2) - (painter.width / 2),
        (gameController.screenSize.height * 0.7) - (painter.height / 2));
    //position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    position = Offset(
        (gameController.screenSize.width / 2) - (painter.width / 2),
        (gameController.screenSize.height * 0.7) - (painter.height / 2));
  }
}
