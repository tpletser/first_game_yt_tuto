import 'package:first_game_yt_tuto/components/enemy.dart';
import 'package:first_game_yt_tuto/game_controller.dart';
import 'package:first_game_yt_tuto/main.dart';
import 'package:flutter/cupertino.dart';

class EnemySpawner{
  final GameController gameController;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 700;
  final int intervalChange = 4;
  final int maxEnemies = 7;
  int currentInterval;
  int nextSpawn;

  EnemySpawner(this.gameController){
    initialize();

  }

  void initialize(){
    killAllEnemies();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;

  }

  void killAllEnemies(){
    gameController.enemies.forEach((Enemy enemy) => enemy.isDead = true);
  }

  void update(double t){
    int now = DateTime.now().millisecondsSinceEpoch;
    if(gameController.enemies.length< maxEnemies && now >= nextSpawn){
      gameController.spawnEnenmy();
      if(currentInterval > minSpawnInterval){
        currentInterval -= intervalChange;
        currentInterval -= (intervalChange)*0.1.toInt();
      }
      nextSpawn = now + currentInterval;
    }
  }
}