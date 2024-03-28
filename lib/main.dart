import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/calender_screen.dart';
import 'screens/sports_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Project",
      initialRoute: '/',
      routes: {
        '/': (context) => const BottomNavBar(),
        '/login_screen':(context) => const LogInScreen(),
        '/home_screen':(context) => const HomeScreen(),
        '/signup_screen':(context) => const SignUpScreen()
      },
    )
  );
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexBottomNav = 0;
  List widgetOption = const [
    LogInScreen(), CalenderScreen(), SportsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOption[indexBottomNav],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calender'),
        BottomNavigationBarItem(icon: Icon(Icons.sports_football), label: 'Sports'),
      ],
      currentIndex: indexBottomNav,
      onTap: (value) => setState(() {
        indexBottomNav = value;
      }),
      ),
    );
  }
}