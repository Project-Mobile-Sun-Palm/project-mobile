import 'package:flutter/material.dart';

class EnduranceScreen extends StatefulWidget {
  const EnduranceScreen({super.key});

  @override
  State<EnduranceScreen> createState() => _EnduranceScreenState();
}

class _EnduranceScreenState extends State<EnduranceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Endurance",
          style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Text("Endurance"),
      ),
    );
  }
}