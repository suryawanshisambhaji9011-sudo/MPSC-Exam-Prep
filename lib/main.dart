import 'package:flutter/material.dart';
import 'package:mpsc_katta/screens/splash_screen.dart';

void main() {
  runApp(const MpscApp());
}

class MpscApp extends StatelessWidget {
  const MpscApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MPSC Katta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7FA),
          foregroundColor: Color(0xFF0F172A),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
