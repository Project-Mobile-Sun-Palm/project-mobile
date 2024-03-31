import 'package:flutter/material.dart';

class StrengthScreen extends StatefulWidget {
  const StrengthScreen({super.key});

  @override
  State<StrengthScreen> createState() => _StrengthScreenState();
}

class _StrengthScreenState extends State<StrengthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strength",
          style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text("Strength"),
      ),
    );
  }
}