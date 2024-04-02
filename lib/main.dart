import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/controllers/login_controller.dart';
import 'package:project/firebase_options.dart';
import 'views/signup_screen.dart';
import 'views/home/home_screen.dart';
import 'views/calender_screen.dart';
import 'views/sports/sports_screen.dart';
import 'views/bmi_screen.dart';
import 'views/menu/menu_screen.dart';
import 'views/menu/course/cardio/cardio_screen.dart';
import 'views/menu/course/strength/strength_screen.dart';
import 'views/menu/course/abs/abs_screen.dart';
import 'views/setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/views/menu/course/strength/strength_workout.dart';
import 'package:project/views/menu/course/cardio/cardio_workout.dart';
import 'package:project/views/menu/course/abs/abs_workout.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
late final FirebaseFirestore fireStore;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  fireStore = FirebaseFirestore.instanceFor(app: app);

  runApp(MaterialApp(
    title: "Project",
    initialRoute: '/',
    routes: {
      '/': (context) => const MainPage(),
      '/bottomnavbar': (context) => const BottomNavBar(),
      '/login_screen': (context) => const LogInController(),
      '/home_screen': (context) => const HomeScreen(),
      '/bmi_screen': (context) => const BMIScreen(),
      '/signup_screen': (context) => const SignUpScreen(),
      '/sports': (context) => const SportsScreen(),
      '/menu_screen': (context) => const MenuScreen(),
      '/cardio_screen': (context) => const CardioScreen(),
      '/strength_screen': (context) => const StrengthScreen(),
      '/abs_screen': (context) => const AbsScreen(),
      '/setting_screen': (context) => const SettingScreen(),
      '/strength_workout': (context) => StrengthWorkout(),
      '/cardio_workout': (context) => CardioWorkout(), 
      '/abs_workout': (context) => AbsWorkout(),   
    },
  ));
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexBottomNav = 0;
  List widgetOption = const [HomeScreen(), CalenderScreen(), SportsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOption[indexBottomNav],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calender'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_football), label: 'Sports'),
        ],
        currentIndex: indexBottomNav,
        onTap: (value) => setState(() {
          indexBottomNav = value;
        }),
      ),
    );
  }
}
