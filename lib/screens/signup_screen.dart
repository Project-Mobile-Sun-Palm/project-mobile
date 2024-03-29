import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Sign Up"),
      //   backgroundColor: Colors.green,
      // ),
      backgroundColor: Colors.deepOrange,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 90,
                ),

              Container(
                height: 710,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.white
                ),
              ),
                
              ],
            ),
        
            Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
          
        // Text "Create Account"
                Row(
                  children: [
                    const SizedBox(
                      width: 90,
                    ),
                    Container(
                      height: 50,
                      width: 160,
                      decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(
                          blurRadius: 10, 
                          blurStyle: BlurStyle.outer, 
                          spreadRadius: 3, 
                          color: Colors.black,
                        )]
                      ),
                      child: const Center(
                        child: Text("C r e a t e", style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                        )),
                      ),
                    )
                  ],
                ),
            
                Row(
                  children: [
                    const SizedBox(
                      width: 130,
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(
                          blurRadius: 10, 
                          blurStyle: BlurStyle.outer, 
                          spreadRadius: 3, 
                          color: Colors.black,
                        )]
                      ),
                      child: const Center(
                        child: Text("A c c o u n t", style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    )
                  ],
                ),
            
                const SizedBox(
                    height: 30,
                  ),
        
        // TextFormField Email
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: const BoxDecoration(
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                  ),
                ),
            
                const SizedBox(
                    height: 30,
                  ),
            
        // TextFormField Username
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: const BoxDecoration(
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Username"
                    ),
                  ),
                ),
            
                const SizedBox(
                    height: 30,
                  ),
            
        // TextFormField Password
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: const BoxDecoration(
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password"
                    ),
                  ),
                ),
            
                const SizedBox(
                    height: 30,
                  ),
            
        // TextFormField Confirm Password
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: const BoxDecoration(
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Confirm password"
                    ),
                  ),
                ),
            
                const SizedBox(
                  height: 50,
                ),
        
        // Button SignUp
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(" "),
                        Text("SIGN UP", style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),),
                        Icon(Icons.arrow_forward_ios, color: Colors.white,)
                      ],
                    ), 
                  ),
                ),
            
                const SizedBox(
                  height: 40,
                ),
        
        // Button SignIn
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  child: const SizedBox(
                    width: 245,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Already have an account?", style: TextStyle(
                            fontSize: 16
                          )),
                          Text("Sign In", style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue
                          ))
                        ],
                      ),
                    ),
                  ),
                )
                
            
              ],
            ),
          ],
        ),
      )
    );
  }
}