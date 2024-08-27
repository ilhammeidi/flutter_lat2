import 'package:flutter/material.dart';
import 'package:latihan2/pages/socmed.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 1',
      theme: ThemeData(
        primaryColor: Colors.amber[400],
      ),
      home: const Socmed()
    );
  }
}
