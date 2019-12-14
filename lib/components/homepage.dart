
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Size screenSize;

  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      body: buildButtons(),
    );
  }

  Widget buildButtons() {
    return new Column(
      children: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pushNamed('/start'),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 50,
            margin: EdgeInsets.only(
                top: screenSize.height * 3 / 4,
                bottom: screenSize.height / 100,
                left: screenSize.width / 5,
                right: screenSize.width / 5),
            child: Center(
              child: Text('Play',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
          ),
        ),
        FlatButton(
          onPressed: () => Navigator.of(context).pushNamed('/start'),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 50,
            margin: EdgeInsets.only(
                left: screenSize.width / 5, right: screenSize.width / 5),
            child: Center(
              child: Text(
                'Highscore',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
//() => Navigator.of(context).pushNamed('/score')),
  }
}
