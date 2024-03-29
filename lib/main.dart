import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/calender_screen.dart';
import 'screens/sports_screen.dart';
import 'screens/bmi_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/cardio_screen.dart';
import 'screens/strength_screen.dart';
import 'screens/endurance_screen.dart';
import 'screens/setting.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Project",
      initialRoute: '/sports',
      routes: {
        '/':(context) => const LogInScreen(),
        '/bottomnavbar':(context) => const BottomNavBar(),
        '/login_screen':(context) => const LogInScreen(),
        '/home_screen':(context) => const HomeScreen(),
        '/bmi_screen':(context) => const BMIScreen(),
        '/signup_screen':(context) => const SignUpScreen(),
        '/sports':(context) => const SportsScreen(),
        '/menu_screen':(context) => const MenuScreen(),
        '/cardio_screen':(context) => const CardioScreen(),
        '/strength_screen':(context) => const StrengthScreen(),
        '/endurance_screen':(context) => const EnduranceScreen(),
        '/setting_screen':(context) => const SettingScreen()
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
    HomeScreen(), CalenderScreen(), SportsScreen()
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