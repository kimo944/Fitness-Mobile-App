import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in/BMI/Components/Icon_Content.dart';
import 'package:sign_in/BMI/Components/Reusable_Bg.dart';
import 'chat_screen.dart';
import 'package:sign_in/BMI/constants.dart';

//late int notify;

//late int send_count = notify;

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final firestore = FirebaseFirestore.instance;
  //late bool click;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 230, 0),
        title: Text(
          'FitCore Coaches',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                List<UserLine> userWidgets = [];

                if (!snapshot.hasData) {}

                final users = snapshot.data!.docs;

                for (var user in users) {
                  final userText = user.get('user_name');
                  final userEmail = user.get('Email');
                  //final messageText2 = message.get('Email');

                  final userWidget = UserLine(
                    userName: userText,
                    Email: userEmail,
                  );
                  // final messageText = message.get('user_name');

                  userWidgets.add(userWidget);
                }

                return Expanded(
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    padding: EdgeInsets.all(0),
                    children: userWidgets,
                  ),
                );
              }),

          // TextButton(
          //     onPressed: () {
          //       messagesStreams();
          //     },
          //     child: Text('send')),
        ],
      ),
    );
  }
}

class UserLine extends StatelessWidget {
  const UserLine({this.userName, this.Email, super.key});

  final String? userName;
  final String? Email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          print(userName);

          UserName = userName.toString();
          chat_Email = Email.toString();

          Navigator.of(context).pushNamed('chatScreen');
        },
        child: ReusableBg(
          colour: kactiveCardColor,
          cardChild: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'images/FITCORE.jpeg',
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$userName ',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  // Text(
                  //   'oj',
                  //   style: TextStyle(fontSize: 30),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
