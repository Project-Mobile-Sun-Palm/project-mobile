import 'package:flutter/material.dart';
import 'package:project/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? errorMessage = '';
  String noUsername = '';
  String noEmail = '';
  String noPassword = '';
  String wrongInput = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerCheckPassword = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      // update database
      // UserDBService()
      //     .addAccount(Account(_controllerUsername.text, _controllerEmail.text));
      SignUpController().addData(_controllerUsername.text, _controllerEmail.text, 0, 0, 0);
    } on FirebaseException catch (e) {
      print("cannot create account");
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  // Widget _errorMessage() {
  //   return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  // }

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
                  const SizedBox(
                    height: 90,
                  ),
                  Container(
                    height: 710,
                    width: 450,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.white),
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
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 3,
                            color: Colors.black,
                          )
                        ]),
                        child: const Center(
                          child: Text("C r e a t e",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
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
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 3,
                            color: Colors.black,
                          )
                        ]),
                        child: const Center(
                          child: Text(
                            "A c c o u n t",
                            style: TextStyle(
                                fontSize: 35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // TextFormField Username
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: const BoxDecoration(),
                    child: TextFormField(
                      controller: _controllerUsername,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person), labelText: "Username"),
                    ),
                  ),

                  SizedBox(
                    height: 20, child: Text(noUsername, style: TextStyle(color: Colors.red),),
                  ),

                  // TextFormField Email
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: const BoxDecoration(),
                    child: TextFormField(
                      controller: _controllerEmail,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email",
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20, child: Text(noEmail, style: TextStyle(color: Colors.red),),
                  ),

                  // TextFormField Password
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: const BoxDecoration(),
                    child: TextFormField(
                      controller: _controllerPassword,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock), labelText: "Password"),
                    ),
                  ),

                  SizedBox(
                    height: 20, child: Text(noPassword, style: TextStyle(color: Colors.red),),
                  ),

                  // TextFormField Confirm Password
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: const BoxDecoration(),
                    child: TextFormField(
                      controller: _controllerCheckPassword,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: "Confirm password"),
                    ),
                  ),

                  SizedBox(
                    height: 50, child: Text(wrongInput, style: TextStyle(color: Colors.red),),
                  ),

                  // Button SignUp
                  InkWell(
                    onTap: () async {
                      if (_controllerUsername.text == "") {
                        setState(() {
                          noUsername = "Please input a Username";
                        });
                      } else {
                        setState(() {
                          noUsername = "";
                        });
                      }

                      if (_controllerEmail.text == "") {
                          setState(() {
                          noEmail = "Please input an Email";
                        }); 
                      } else {
                        setState(() {
                          noEmail = "";
                        });
                      }

                      if (_controllerPassword.text != "") {
                        setState(() {
                          noPassword = "";
                        });
                      }

                      if (_controllerPassword.text == "") {
                        setState(() {
                          noPassword = "Please input a Password";
                        });
                      } else if (_controllerPassword.text != _controllerCheckPassword.text) {
                        setState(() {
                          wrongInput = "Password is not match.";
                        });
                      } else if (_controllerUsername.text != "" &&
                                 _controllerEmail.text != "" &&
                                 _controllerPassword.text != "") {
                                await createUserWithEmailAndPassword();
                                Navigator.pushNamed(context, '/bottomnavbar');
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(" "),
                          Text(
                            "SIGN UP",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
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
                            Text("Already have an account?",
                                style: TextStyle(fontSize: 16)),
                            Text("Sign In",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
