import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/BMI/Screens/input_page.dart';
import 'package:sign_in/Game/Game.dart';
import 'package:sign_in/screens/chat_screen.dart';
import 'package:sign_in/screens/contact_screen.dart';
import 'package:sign_in/screens/login_screen.dart';
import 'package:sign_in/screens/signup_screen.dart';
import 'package:sign_in/screens/user_lists.dart';
import 'package:sign_in/screens/user_lists2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  int index = 0;
  final pages = [
    InputPage(),
    Users2(),

    //SignupScreen(),
    //UserList(),
    ContactScreen(),
    MyWidget(),

    //MyApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        height: 60,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            selectedIcon: Icon(Icons.message),
            label: 'Message',
          ),
          NavigationDestination(
            icon: Icon(Icons.email_outlined),
            selectedIcon: Icon(Icons.email),
            label: 'Email',
          ),
          NavigationDestination(
            icon: Icon(Icons.gamepad_outlined),
            selectedIcon: Icon(Icons.gamepad),
            label: 'Game',
          ),
          NavigationDestination(
            icon: Icon(Icons.engineering_outlined),
            selectedIcon: Icon(Icons.engineering),
            label: 'AI-Coach',
          ),
        ],
      ),
      body: pages[index],
    );
  }
}
