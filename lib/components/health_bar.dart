import 'dart:ui';

import 'package:first_game_yt_tuto/game_controller.dart';
import 'package:flutter/material.dart';

class HealthBar {
  final GameController gameController;
  Rect healthBarRect;
  Rect remaininghealthRect;

  HealthBar(this.gameController) {
    double barWidth = gameController.screenSize.width / 1.75;
    healthBarRect = Rect.fromLTWH(
        gameController.screenSize.width / 2 - barWidth / 2,
        gameController.screenSize.height * 0.8,
        barWidth,
        gameController.tileSize / 2);
    remaininghealthRect = Rect.fromLTWH(
        gameController.screenSize.width / 2 - barWidth / 2,
        gameController.screenSize.height * 0.8,
        barWidth,
        gameController.tileSize / 2);
  }

  void render(Canvas c) {
    Paint healthBarColor = Paint()..color = Color(0xFFFF0000);
    Paint remaingBarColor = Paint()..color = Color(0xFF00FF00);
    c.drawRect(healthBarRect, healthBarColor);
    c.drawRect(remaininghealthRect, remaingBarColor);
  }

  void update(double t) {
    double barWidth = gameController.screenSize.width / 1.75;
    double percentHealth =
        gameController.player.currentHealth / gameController.player.maxHealth;
    remaininghealthRect = Rect.fromLTWH(
        gameController.screenSize.width / 2 - barWidth / 2,
        gameController.screenSize.height * 0.8,
        barWidth*percentHealth,
        gameController.tileSize / 2);
  }
}
