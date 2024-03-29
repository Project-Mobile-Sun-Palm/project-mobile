import 'package:flutter/material.dart';

class CardioScreen extends StatefulWidget {
  const CardioScreen({super.key});

  @override
  State<CardioScreen> createState() => _CardioScreenState();
}

class _CardioScreenState extends State<CardioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cardio",
          style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text("Cardio"),
      ),
    );
  }
}