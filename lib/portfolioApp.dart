import 'package:flutter/material.dart';
import 'package:portfolio_hyeongin/screens/home_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyeongin Ju - Portfolio',
      theme: ThemeData(
        primaryColor: const Color(0xFF2C3E50),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFF34495E),
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF34495E),
            height: 1.5,
          ),
        ),
      ),
      home: const PortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
