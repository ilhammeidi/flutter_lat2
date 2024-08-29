import 'package:flutter/material.dart';

class TitleStyle {
  static const TextStyle titlePrimary = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleSecondary = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
}

class BtnStyle {
  static ButtonStyle btnPrimary = ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
}

double spacing(int val) {
  return val * 8;
}