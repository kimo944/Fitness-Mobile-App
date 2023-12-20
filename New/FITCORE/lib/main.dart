import 'package:flutter/material.dart';
import 'package:sign_in/BMI/Screens/input_page.dart';
import 'package:sign_in/auth.dart';
//import 'package:sign_in/chat_screens/homePage.dart';
import 'package:sign_in/screens/Start.dart';
import 'package:sign_in/screens/activity.dart';
import 'package:sign_in/screens/chat_screen.dart';
import 'package:sign_in/screens/contact_screen.dart';
import 'package:sign_in/screens/files.dart';
import 'package:sign_in/screens/food.dart';
import 'package:sign_in/screens/home_screen.dart';
import 'package:sign_in/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sign_in/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in/screens/user_lists.dart';
import 'package:sign_in/screens/user_lists2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//final _auth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      //home: SignupScreen(),

      // theme: ThemeData.dark().copyWith(
      //   primaryColor: Color(0xFF0A0E21),
      //   scaffoldBackgroundColor: Color(0xFF0A0E21),
      // ),

      initialRoute: 'Start',
      routes: {
        '/': (context) => const Auth(),
        'homeScreen': (context) => HomeScreen(),
        'signupScreen': (context) => SignupScreen(),
        'login_screen': (context) => LoginScreen(),
        'chatScreen': (context) => ChatScreen(),
        'Contact': (context) => ContactScreen(),
        'BMI': (context) => InputPage(),
        'UsersList': (context) => UserList(),
        'Food': (context) => HomePage(),
        'Start': (context) => StarterPage(),
        'Activity': (context) => Activity(),
        'Users': (context) => Users2(),

        'f': (context) => Files(),

        //  'Users3': (context) => UserList3(
        //         tips: '',
        //       ),
      },
    );
  }
}
