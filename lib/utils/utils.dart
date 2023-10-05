import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  Color calculateTextColor(Color backgroundColor) {
    final double brightness = (backgroundColor.red * 299 +
            backgroundColor.green * 587 +
            backgroundColor.blue * 114) /
        1000;

    return brightness > 128 ? Colors.black : Colors.white;
  }
}
