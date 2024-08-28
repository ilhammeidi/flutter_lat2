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
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.amber[400],
        colorScheme: ColorScheme.light(
          primary: Colors.blue,           // Primary color of the app
          secondary: Colors.orange,        // Secondary color (used for accents)
          surface: Colors.white,           // The background color for cards and menus
          error: Colors.red,           // Color for error messages and icons
          onPrimary: Colors.black,       // Text and icons on secondary color
          onSecondary: Colors.grey[700]!,         // Text and icons on primary color
          onSurface: Colors.black,         // Text and icons on surface color
          onError: Colors.red,           // Text and icons on error color
          brightness: Brightness.light,
          outline: Colors.grey[300]!,   // Defines whether the color scheme is light or dark
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,           // Primary color of the app
          secondary: Colors.orange,        // Secondary color (used for accents)
          surface: Colors.black,           // The background color for cards and menus
          error: Colors.red,           // Color for error messages and icons
          onPrimary: Colors.white,         // Text and icons on primary color
          onSecondary: Colors.grey[300]!,      // Text and icons on secondary color
          onSurface: Colors.white,         // Text and icons on surface color
          onError: Colors.red,           // Text and icons on error color
          brightness: Brightness.dark,  
          outline: Colors.grey[800]!,   // Defines whether the color scheme is light or dark
        ),
      ),
      home: const Socmed()
    );
  }
}
