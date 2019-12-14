import 'package:first_game_yt_tuto/components/gamestartpage.dart';
import 'package:first_game_yt_tuto/components/homepage.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: HomePage(),
    ),
    routes: {
      '/home': (BuildContext ctx) => Scaffold(body: HomePage()),
      '/start': (BuildContext ctx) => Scaffold(body: GameStartPage()),
      //'/options': (BuildContext ctx) => Scaffold(body: OptionsScreen()),
      // '/score': (BuildContext ctx) => Scaffold(body: ScoreScreen()),
    },
  ));

      Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  TapGestureRecognizer tapper = TapGestureRecognizer();
  flameUtil.addGestureRecognizer(tapper);
}


