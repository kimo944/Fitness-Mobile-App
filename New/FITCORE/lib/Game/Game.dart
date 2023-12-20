import 'package:flutter/material.dart';

import 'dart:math';
import 'package:sign_in/BMI/constants.dart';
import 'package:sign_in/BMI/Components/Reusable_Bg.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int i = 4;
  int ii = 2;
  @override
  Widget build(BuildContext context) {
    void Modify() {
      i = Random().nextInt(11) + 2;

      ii = Random().nextInt(11) + 2;
    }

    Expanded Image_add() {
      return Expanded(
        child: TextButton(
          onPressed: () {
            //print('HI');
            setState(() {
              Modify();
            });
          },
          child: Image(
            image: AssetImage('images/image--$i.jpg'),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 230, 0),
          centerTitle: true,
          leading: Icon(null),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/FITCORE.jpeg',
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'FitGAME',
                style: TextStyle(color: Colors.black),
              ),
            ],
          )),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ReusableBg(
              colour: Color(0xFF1D1E33),
              cardChild: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  i != ii ? 'Never Give Up' : 'Beast',
                  style: TextStyle(
                      color: i != ii
                          ? const Color.fromARGB(255, 255, 230, 0)
                          : Color.fromARGB(255, 255, 0, 0),
                      fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ReusableBg(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // print(ii);
                            setState(() {
                              Modify();
                            });
                          },
                          child: Image(
                            image: AssetImage('images/image--$i.jpeg'),
                            //  height: 2000,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // print(i);
                            setState(() {
                              Modify();
                            });
                          },
                          child: Image(
                            image: AssetImage('images/image--$ii.jpeg'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
