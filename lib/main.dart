
import 'package:flutter/material.dart';
import 'package:flutter_application_sayurmayur/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sayur Mayur si Tegar',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF17532),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFCF8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF17532),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const Home(),
    );
  }
}