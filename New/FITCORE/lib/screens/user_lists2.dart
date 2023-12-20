import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/animations/FadeAnimation.dart';
import 'chat_screen.dart';

class Users2 extends StatefulWidget {
  @override
  _Users2State createState() => _Users2State();
}

class _Users2State extends State<Users2> {
  final firestore = FirebaseFirestore.instance;

  double sliderHeight = 170.0;
  //late double sliderHeight;

  List<String> categories = [];
  List<dynamic> Activities = [];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        elevation: 10,
        //brightness: Brightness.light,
        leading: Icon(null),
        centerTitle: true,
        // leading: Icon(null),
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.spaceBetween,
            children: [
              Text(
                "FitChat",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FadeAnimation(
              1,
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.grey[800],
                ),
              ))
        ],
      ),

      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     child: ListView.builder(
            //       scrollDirection: Axis.vertical,
            //       itemCount: Activities.length,
            //       itemBuilder: (context, index) => FadeAnimation(
            //         1,
            //         makeItem(
            //           list: Activities,
            //           image: Activities[index]["image"],
            //           isFavorite: Activities[index]["isFavorite"],
            //           title: Activities[index]["title"],
            //           calorie: Activities[index]["calorie"],
            //           note: Activities[index]["note"],
            //           index: index,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget makeItem(
      {userName, Email, list, image, isFavorite, title, calorie, note, index}) {
    //double sliderHeight = 150.0;
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),

            //////////////////////////////////////////////////////////////////////
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            list[index]["isFavorite"] =
                                !list[index]["isFavorite"];
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    width: 1.5,
                                    color: isFavorite
                                        ? Colors.red
                                        : Colors.transparent,
                                  )),
                              child: isFavorite
                                  ? Icon(
                                      Icons.add_circle,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
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
                                      title: const Text('Note'),
                                      contentPadding: const EdgeInsets.all(20),
                                      content: Text(note),
                                    ));
                          });
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.transparent,
                                  )),
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$userName",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
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
    return TextButton(
      onPressed: () {
        print(userName);

        UserName = userName.toString();
        chat_Email = Email.toString();

        Navigator.of(context).pushNamed('chatScreen');
      },
      child: AspectRatio(
        aspectRatio: 1 / 0.7,
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("images/FITCORE.jpeg"),
                  fit: BoxFit.cover,
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, stops: [
                    .2,
                    .9
                  ], colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.3),
                  ])),

              //////////////////////////////////////////////////////////////////////
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "$userName",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
