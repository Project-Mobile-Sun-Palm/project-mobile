import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login_Screen"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            
// Text "Workout"
            const Center(
              child: Text("Workout", style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic
              )),
            ),

// Picture Space
            Container(
              margin: const EdgeInsets.fromLTRB(15, 25, 15, 40),
              height: 315,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
        
// Login Console
            Stack(
              children: [
                Center (
                  child: Container(
                    height: 250,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  )
                ),
        
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
        
                    const SizedBox(
                      width: 270,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Log in", style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          )),
                          Text(" ")
                        ],
                      ),
                    ),

// TextFromField; Email, Password
                    Container(
                      height: 40,
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(60, 10, 60, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'email',
                        ),
                      ),
                    ),
        
                    Container(
                      height: 40,
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(60, 12, 60, 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'password',
                        ),
                      ),
                    ),
        
// Forget Password, Create account
                    SizedBox(
                      width: 270,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text("Forget Password?", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Create account", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                            )),
                          )
                        ],
                      ),
                    ),
        
                    const SizedBox(
                      height: 19,
                    ),

// Login Button
                    SizedBox(
                      width: 230,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(" "),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/home_screen');
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: const Icon(Icons.arrow_forward_rounded, 
                                size: 40,
                                color: Color.fromARGB(255, 8, 62, 138),
                              )
                            ),
                          )
                        ],
                      ),
                    )
                  ],
        
                  
                ),
              ],
            )
        
          ],
        ),
      )
    );
  }
}