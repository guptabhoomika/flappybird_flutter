import 'dart:async';

import 'package:flappybird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdyaxis = 0;
  double time = 0;
  double height = 0;
  double initialheight = birdyaxis;
  bool gamehasstarted = false;
  void jump() {
    setState(() {
      time = 0;
      initialheight = birdyaxis;
    });
  }

  void startgame() {
    gamehasstarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2 * time;
      setState(() {
        birdyaxis = initialheight - height;
      });
      if (birdyaxis > 1) {
        timer.cancel();
        gamehasstarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                  onTap: () {
                    if (gamehasstarted) {
                      jump();
                    } else {
                      startgame();
                    }
                  },
                  child: AnimatedContainer(
                    alignment: Alignment(0, birdyaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: Bird(),
                  ))),
          Expanded(
              child: Container(
            color: Colors.green,
          )),
        ],
      ),
    );
  }
}
