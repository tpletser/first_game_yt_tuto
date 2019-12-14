import 'package:first_game_yt_tuto/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameStartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GameStartPageState();

}

class GameStartPageState extends State<GameStartPage>{
   GameController gameController;
   bool restart = false;
   SharedPreferences storage;

  @override
  Widget build(BuildContext context) {
    initializePref();
    gameController = GameController(this,storage);
    return Scaffold(
      body:gameController.widget,
    floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.of(context).pushNamed('/home'),
      child: Icon(Icons.home),
    ),);
  }

   initializePref() async{
    storage = await SharedPreferences.getInstance();
    }
  }