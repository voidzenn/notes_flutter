import 'dart:math' as math;

import 'package:flutter/material.dart';

class CwCard extends StatelessWidget {
  final rnd = math.Random();
  final Widget widget;
  final Widget button;

  CwCard({Key? key, required this.widget, required this.button}) : super(key: key);

  Color getRandomColor() {
    return Color(rnd.nextInt(0xffffffff));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getRandomColor(),
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [widget, button],
        ),
      ),
    );
    ;
  }
}
