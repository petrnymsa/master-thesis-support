import 'dart:math';

import 'package:flutter/material.dart';

class RandomColor {
  static final usedColors = <Color>[];
  static final random = Random();

  static Color get() {
    final color = Color.fromARGB(255, random.nextInt(255) + 1,
        random.nextInt(255) + 1, random.nextInt(255) + 1);
    usedColors.add(color);

    return color;
  }
}
