// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_in/screens/chat_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  String? userName;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Future SignUp() async {
    void Error_Message(String Message) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  )
                ],
                title: const Text('Error'),
                contentPadding: const EdgeInsets.all(20),
                content: Text(Message),
              ));
    }

    String Message = '';

    if (userName!.length < 2) {
      Message = ' User name too short \n';
    }

    if (_emailController.text.trim()!.length < 2) {
      Message = '$Message Email too short \n';
    }

    if (_passwordController.text.trim()!.length == 0) {
      Message = '$Message Password Empty \n';
    }

    // StreamBuilder<QuerySnapshot>(
    //     stream: firestore.collection('users').snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) {}

    //       final users = snapshot.data!.docs;

    //       for (var user in users) {
    //         final userText = user.get('user_name');
    //         final userEmail = user.get('Email');

    //         if (_emailController.text.trim() == userEmail) {
    //           Message = '$Message Email Already Exist \n';
    //         }
    //       }

    //       Error_Message(Message);

    //       return Error_Message(Message);

    //     });

    // await for (var snapshot in firestore.collection('users').snapshots()) {
    //   for (var user in snapshot.docs) {
    //     if (_emailController.text.trim() == user.get('Email')) {
    //       Message = '$Message Email Already Exist \n';
    //     }
    //   }
    // }

    final users = await firestore.collection('users').get();
    for (var user in users.docs) {
      if (_emailController.text.trim() == user.get('Email')) {
        Message = '$Message Email Already Exist \n';
      }
      if (userName == user.get('user_name')) {
        Message = '$Message User name Already Exist \n';
      }
    }

    Error_Message(Message);

    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      firestore.collection('users').add({
        'user_name': userName,
        'Email': _emailController.text.trim(),
      });

      Navigator.of(context).pushNamed('/');
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void openLoginScreen() {
    // Navigator.of(context).pushReplacementNamed('logginScreen');

    Navigator.pushNamed(context, 'login_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image

                Image.asset(
                  'images/FITCORE.jpeg',
                  height: 180,
                ),

                SizedBox(height: 20),

                //Title

                Text(
                  'FITCORE',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),

                //Subtitle

                Text(
                  'sign up',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 18,
                  ),
                ),

                SizedBox(height: 50),

                //Email Textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: formstate,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length < 2) {
                              return 'too short';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            userName = value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Full Name',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 2) {
                            return 'too short';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //Pass Textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //Confirm Pass Textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // TextButton(
                //     onPressed: () {
                //       firestore.collection('users').add({
                //         'user_name': userName,
                //         //'Email': _emailController.text.trim(),
                //       });
                //     },
                //     child: Text('send')),

                //Sign Up Button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: SignUp,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                        'Sign Up',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                //Sign UP

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member ? ',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: openLoginScreen,
                      child: Text(
                        'Sign IN here ',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
