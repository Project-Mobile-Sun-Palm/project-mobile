import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/services/auth.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String? errorMessage = '';
  bool _passwordVisible = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text
      );
      Navigator.pushNamed(context, '/bottomnavbar');
    } on FirebaseException catch (e) {
      setState(() {
        print("not found");
        errorMessage = e.message;
      });
    }
  }

  Widget _entryEmail(
    TextEditingController controller
  ) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'email',
        border: OutlineInputBorder()
      ),
    );
  }

  Widget _entryPassword(
    TextEditingController controller
  ) {
    return TextField(
      controller: controller,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        hintText: 'password',
        suffixIcon: IconButton(
          icon: Icon(
          _passwordVisible
          ? Icons.visibility_off
          : Icons.visibility,
          color: Colors.black54,
          ),
          onPressed: () {
            setState(() {
            _passwordVisible = !_passwordVisible;
            });
          },
        ),
        border: const OutlineInputBorder()
      ),
    );
  }

  // Widget _errorMessage() {
  //   return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  // }

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
              height: 75,
            ),
            
// Text "Workout"
            Container(
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(
                  blurRadius: 10, 
                  blurStyle: BlurStyle.outer, 
                  spreadRadius: 3, 
                  color: Colors.black,
                )]
              ),
              child: const Center(
                child: Text("Workout", style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
                )),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

// Picture Space
            Stack(
              children: [
                Container(
                  height: 355,
                  width: double.infinity,
                  color: Colors.blueGrey[300],
                ),

                Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),

                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 300,
                          width: 380,
                          child: Expanded(
                            child: Image.asset("assets/images/workout.png", fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
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
                      child: _entryEmail(_controllerEmail)
                    ),
        
                    Container(
                      height: 60,
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(60, 12, 60, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: _entryPassword(_controllerPassword)
                    ),
        
// Forget Password, Create account
                    SizedBox(
                      width: 275,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text("Don't have an account?", style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                            )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup_screen');
                            },
                            child: const Text("Create account", style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            )),
                          )
                        ],
                      ),
                    ),
        
                    const SizedBox(
                      height: 12,
                    ),

// Login Button
                    SizedBox(
                      width: 230,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(" "),
                          InkWell(
                            onTap: () async {
                              await signInWithEmailAndPassword();
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: const Icon(Icons.arrow_forward_rounded, 
                                size: 45,
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