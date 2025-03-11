// TODO Implement this library.

import 'package:flutter/material.dart';

class AgeCategory {
  final String label;
  final Color color;

  AgeCategory(this.label, this.color);

  static AgeCategory fromAge(int age) {
    if (age > 65) {
      return AgeCategory("Người già", Colors.brown);
    } else if (age >= 6) {
      return AgeCategory("Người lớn", Colors.blue);
    } else if (age >= 2) {
      return AgeCategory("Trẻ em", Colors.orange);
    } else {
      return AgeCategory("Em bé", Colors.pink);
    }
  }
}
