import 'package:flutter/material.dart';
import 'package:latihan2/pages/barber_shop.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Latihan 2',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            fontFamily: 'Quicksand',
            primaryColor: Colors.amber[500],
            primaryColorDark: Colors.amber[900],
            primaryColorLight: Colors.amber[100],
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              )
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              primaryContainer: Colors.blue[200],
              onPrimaryContainer: Colors.blue[800],
              secondary: Colors.orange,
              onSecondary: Colors.white,
              secondaryContainer: Colors.orange[200],
              onSecondaryContainer: Colors.orange[900],
              surface: Colors.white,
              onSurface: Colors.black,
              surfaceContainerLowest: Colors.grey[200] ,
              onSurfaceVariant: Colors.grey[500],
              error: Colors.red,
              onError: Colors.white,
              brightness: Brightness.light,
              outline: Colors.grey[300]!,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.dark(
              primary: Colors.blue,
              onPrimary: Colors.white,
              primaryContainer: Colors.blue[800],
              onPrimaryContainer: Colors.blue[200],
              secondary: Colors.orange,
              onSecondary: Colors.white,
              secondaryContainer: Colors.orange[900],
              onSecondaryContainer: Colors.orange[200],
              surface: Colors.black,
              onSurface: Colors.white,
              surfaceContainerLowest: Colors.grey[800] ,
              onSurfaceVariant: Colors.grey[200],
              error: Colors.red,
              onError: Colors.white,
              brightness: Brightness.dark,
              outline: Colors.grey[800]!, // Defines whether the color scheme is light or dark
            ),
          ),
          home: const BarberShop()
        );
      }
    );
  }
}
