import 'package:flutter/material.dart';
import 'package:mpsc_katta/screens/home_screen.dart';
import 'package:mpsc_katta/screens/subject_screen.dart';
import 'package:mpsc_katta/screens/planner_screen.dart';
import 'package:mpsc_katta/screens/progress_screen.dart';
import 'package:mpsc_katta/screens/profile_screen.dart';

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
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SubjectScreen(),
    PlannerScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'मुख्यपृष्ठ',
          ),
          NavigationDestination(
            icon: Icon(Icons.subject_outlined),
            selectedIcon: Icon(Icons.subject),
            label: 'विषय',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'नियोजन',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'प्रगती',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'प्रोफाइल',
          ),
        ],
      ),
    );
  }
}
