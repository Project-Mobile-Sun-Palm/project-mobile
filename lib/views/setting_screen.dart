import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  void goBack() {
    Navigator.pushNamed(context, '/bottomnavbar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60,),

            Row(
              children: [
                Text("   "),

                IconButton(
                  onPressed: goBack, 
                  icon: Icon(Icons.arrow_back, size: 28, color: Colors.black,)
                ),

                Text(" Setting", style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),

            Center(
              child: Text("Setting"),
            )
        ],
      )
    );
  }
}