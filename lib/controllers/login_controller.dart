import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/services/auth.dart';
import 'package:project/views/login_screen.dart';

class LogInController extends StatefulWidget {
  const LogInController({super.key});

  @override
  State<LogInController> createState() => _LogInControllerState();
}

class _LogInControllerState extends State<LogInController> {

  @override
  Widget build(BuildContext context) {
    return LogInScreen();
  }
}