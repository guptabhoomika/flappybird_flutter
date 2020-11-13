import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: Image.asset(
          "assests/Flappy-Bird-Logo-PNG-Pic.png",
        ));
  }
}
