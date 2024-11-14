import 'package:bmi/home.dart';
// import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white, size: 90),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 35, fontWeight: FontWeight.w800, color: Colors.black),
          bodySmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: const MyHomePage(),
      // Reuslt(result: 18, isMale: true, age: 22)
    );
  }
}
