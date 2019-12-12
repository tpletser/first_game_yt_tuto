import 'dart:ui';

import 'package:first_game_yt_tuto/game_controller.dart';
import 'package:first_game_yt_tuto/state.dart';

class Player {
  final GameController gameController;
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  bool isDead = false;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - size/2,
      gameController.screenSize.height / 2 - size/2,
      size,
      size,
    );
  }
  void render(Canvas c) {
    Paint color = Paint()..color = Color(0xFF0000FF);
    c.drawRect(playerRect, color);
  }

  void update(double t) {
    if(!isDead && currentHealth <= 0){
      isDead = true;
      gameController.state = State.game_over;
    }
  }
}
