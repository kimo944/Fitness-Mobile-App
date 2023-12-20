import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'user_lists.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

final _firestore = FirebaseFirestore.instance;
late User signedInUser;
late String UserName;
late String chat_Email;
String groupChatId = "";
String currentUserId = "";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

late Future<ListResult> futurefiles;

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;
  late int notify;
  PlatformFile? pickedFile;

  final futurefiles = FirebaseStorage.instance.ref('/files').listAll();

  Future SelectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    uploadFile2();
    downloadFile();
  }

  Future downloadFile() async {}

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  File? imageFile;
  bool isLoading = false;
  String imageUrl = '';

  TextEditingController messageController = TextEditingController();

  void onSendMessage({String? duration = ""}) {
    if (messageTextController.text.isNotEmpty) {
      messageTextController.clear();
      _firestore.collection('messages').add({
        'text': messageText,
        'sender': signedInUser.email,
        'time': FieldValue.serverTimestamp(),
        'receiver': chat_Email,
      });
      // send_count1++;

      // _scrollController.animateTo(0,
      //     duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing to send', backgroundColor: Colors.grey);
    }
  }

  Future uploadFile2() async {
    final path = 'files/${signedInUser.email}to${chat_Email}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Icon(null),
        backgroundColor: Colors.yellow[900],
        titleSpacing: 0.0,
        title: Transform(
          transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
          child: Row(children: [
            Image.asset(
              'images/FITCORE.jpeg',
              height: 50,
            ),
            SizedBox(
              width: 10,
            ),
            // Text('MessageMe'),
            Text(UserName)
          ]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();

              Navigator.pushNamed(context, 'login_screen');
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.orange, width: 2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Icon(
                        Icons.photo,
                      ),
                      onTap: () {
                        // getImage();

                        SelectFile();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'Write your message here....',
                          border: InputBorder.none),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        onSendMessage();
                      },
                      child: Text(
                        'send',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        List<MessageLine> messageWidgets = [];

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }

        final messages = snapshot.data!.docs;
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = signedInUser.email;
          final messageReciever = message.get('receiver');

          // int x = 0;
          if (currentUser == messageReciever) {
            // notify++;
          }

          if ((currentUser == messageSender && messageReciever == chat_Email) ||
              (messageSender == chat_Email && messageReciever == currentUser)) {
            if (currentUser == messageSender) {}

            final messageWidget = MessageLine(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );

            messageWidgets.add(messageWidget);
          }
        }

        return Expanded(
          child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets),
        );
      },
    );
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine(
      {this.reciever, this.text, this.sender, required this.isMe, Key? key})
      : super(key: key);

  final String? sender;
  final String? text;
  final bool isMe;
  final String? reciever;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(fontSize: 12, color: Colors.yellow[900]),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            color: isMe ? Colors.blue[800] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 15, color: isMe ? Colors.white : Colors.black45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
