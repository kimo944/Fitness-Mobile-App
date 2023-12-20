import 'package:flutter/material.dart';
import 'package:sign_in/BMI/constants.dart';
import 'package:sign_in/BMI/Components/Reusable_Bg.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/back5.jpg"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                ReusableBg(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   radius: 50,
                      //   backgroundColor: Colors.white,
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'images/FITCORE.jpeg',
                        height: 300,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'FITCORE',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 230, 0)),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 255, 230, 0),
                        margin: EdgeInsets.all(20),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 70,
                              // child: Divider(
                              //   height: 10,

                              //   color: Colors.black,
                              // ),
                            ),
                            Text(
                              '0115828288',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: const Color.fromARGB(255, 255, 230, 0),
                        margin: EdgeInsets.all(20),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 70,
                              // child: Divider(
                              //   height: 10,

                              //   color: Colors.black,
                              // ),
                            ),
                            Text(
                              'fitcore.egypt',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
