import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Project",
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login_screen':(context) => const LogInScreen(),
        '/home_screen':(context) => const HomeScreen(),
      },
    )
  );
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Sign Up"),
      //   backgroundColor: Colors.green,
      // ),
      backgroundColor: Colors.deepOrange,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(200)
            )
          ),

          Column(
            children: [
              const SizedBox(
                height: 80,
              ),
  
// Text "Create Account"
              const Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Text("C r e a t e", style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic
                  ))
                ],
              ),
          
              const Row(
                children: [
                  SizedBox(
                    width: 140,
                  ),
                  Text("A c c o u n t", style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic
                  ),)
                ],
              ),
          
              const SizedBox(
                  height: 20,
                ),

// TextFormField Email
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Email"
                  ),
                ),
              ),
          
              const SizedBox(
                  height: 30,
                ),
          
// TextFormField Username
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                ),
                child: TextFormField(
                  decoration: InputDecoration(
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
                decoration: BoxDecoration(
                ),
                child: TextFormField(
                  decoration: InputDecoration(
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
                decoration: BoxDecoration(
                ),
                child: TextFormField(
                  decoration: InputDecoration(
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
                height: 30,
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
      )
    );
  }
}