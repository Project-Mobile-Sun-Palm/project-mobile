import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:project/services/database_user.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  TextEditingController usernameController = TextEditingController();
  late String username = "";

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
                  icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black,)
                ),

                const Text(" Setting", style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),

            const SizedBox(
              height: 260,
            ),

            SizedBox(
              height: 70,
              width: 390,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange)
                  )
                ),
              ),
            ),
 
            const SizedBox(
              height: 15,
            ),

            InkWell(
              onTap: () {
                username = usernameController.text;
                setState(() {
                  DatabaseUser().updateUsername(Auth().currentUser!.uid, username);
                });
              },
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepOrange
                ),
                child: const Center(
                  child: Text("Change", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),),
                ),
              ),
            )
        ],
      )
    );
  }
}