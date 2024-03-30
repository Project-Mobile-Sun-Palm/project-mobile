import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/services/auth.dart';
import 'package:project/views/home/home_screen.dart';
import 'package:project/views/login_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BottomNavBar();
        } else {
          return LogInScreen();
        }
      });
  }
}