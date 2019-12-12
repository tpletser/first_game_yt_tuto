import 'dart:math';

import 'package:first_game_yt_tuto/components/game_over_text.dart';
import 'package:first_game_yt_tuto/components/health_bar.dart';
import 'package:first_game_yt_tuto/components/highscore_text.dart';
import 'package:first_game_yt_tuto/components/player.dart';
import 'package:first_game_yt_tuto/components/restart_text.dart';
import 'package:first_game_yt_tuto/components/score_text.dart';
import 'package:first_game_yt_tuto/components/start_text.dart';
import 'package:first_game_yt_tuto/enemy_spawner.dart';
import 'package:first_game_yt_tuto/state.dart';
import 'package:first_game_yt_tuto/state.dart' as prefix0;
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/enemy.dart';

class GameController extends Game {
  final SharedPreferences storage;
  Size screenSize;
  double tileSize;
  Player player;
  EnemySpawner enemySpawner;
  List<Enemy> enemies;
  HealthBar healthBar;
  Random rand;
  int score = 0;
  ScoreText scoreText;
  prefix0.State state;
  HighscoreText highscoreText;
  StartText startText;
  GameOverText gameOverText;
  ReStartText reStartText;


  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    state = prefix0.State.menu;
    rand = Random();
    score = 0;
    player = Player(this);
    enemies = List<Enemy>();
    enemySpawner = EnemySpawner(this);
    healthBar = HealthBar(this);
    scoreText = ScoreText(this);
    highscoreText = HighscoreText(this);
    startText = StartText(this);
    gameOverText = GameOverText(this);
    reStartText = ReStartText(this);
  }

  void render(Canvas c) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(background, backgroundPaint);

    player.render(c);
    if (state == prefix0.State.menu) {
      startText.render(c);
      highscoreText.render(c);
    } else if (state == prefix0.State.playing) {
      enemies.forEach((Enemy enemy) => enemy.render(c));
      scoreText.render(c);
      healthBar.render(c);
    }
    else if (state == prefix0.State.game_over){
      gameOverText.render(c);
      reStartText.render(c);
    }
  }

  void update(double t) {
    if (state == prefix0.State.menu) {
      startText.update(t);
      highscoreText.update(t);

    } else if (state == prefix0.State.playing) {
      enemySpawner.update(t);
      enemies.forEach((Enemy enemy) => enemy.update(t));
      enemies.removeWhere((Enemy enemy) => enemy.isDead);
      player.update(t);
      scoreText.update(t);
      healthBar.update(t);
    }
    else if (state == prefix0.State.game_over){
      enemies.forEach((Enemy enemy) => enemy.update(t));
      gameOverText.update(t);
      reStartText.update(t);
    }
  }

  void resize(Size size) {
    this.screenSize = size;
    this.tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d) {
    if (state == prefix0.State.menu) {
      state = prefix0.State.playing;
    }
    else if (state == prefix0.State.playing) {
      enemies.forEach((Enemy enemy) {
        if (enemy.enemyRect.contains(d.globalPosition)) {
          enemy.onTapDown();
        }
      });
    }
    else if (state == prefix0.State.game_over){
      initialize();

    }
  }

  void spawnEnenmy() {
    double x, y;
    switch (rand.nextInt(4)) {
      case 0:
        //Top
        x = rand.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
        break;

      case 1:
        //Right
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
      case 2:
        //Bottm
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        break;
      case 3:
        //Left
        x = -tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
    }
    enemies.add(Enemy(this, x, y));
  }
}
