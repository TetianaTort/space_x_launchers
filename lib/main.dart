import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_x_launchers/modules/main_screen/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Launchers',
      theme: ThemeData().copyWith(
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            color: Color.fromRGBO(165, 165, 165, 1),
            fontSize: 16,
          ),
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme().copyWith(
          titleTextStyle: const TextStyle(fontSize: 24),
          elevation: 0,
          color: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
