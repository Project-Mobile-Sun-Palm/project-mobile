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
              height: 80,
            ),
            
// Text "Workout"
            const Center(
              child: Text("Workout", style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
              )),
            ),

            const SizedBox(
              height: 20,
            ),

// Picture Space
            SizedBox(
              height: 300,
              width: 600,
              child: Expanded(
                child: Image.asset("assets/images/workout.png"),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
        
// Login Console
            Stack(
              children: [
                Center (
                  child: Container(
                    height: 290,
                    width: 340,
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
                      height: 60,
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(60, 10, 60, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'email',
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
        
                    Container(
                      height: 60,
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(60, 12, 60, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'password',
                          border: OutlineInputBorder()
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
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup_screen');
                            },
                            child: const Text("Create account", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            )),
                          )
                        ],
                      ),
                    ),
        
                    const SizedBox(
                      height: 15,
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
                              Navigator.pushNamed(context, '/bottomnavbar');
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