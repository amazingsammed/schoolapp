import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/generated/assets.dart';
import 'package:schoolapp/models/message.dart';
import 'package:schoolapp/models/user_model.dart';
import 'package:schoolapp/widgets/constants.dart';

import 'componets.dart';

class ChatScreen extends StatelessWidget {
  ChatRoom chatroomitem;
  ChatScreen({Key? key, required this.chatroomitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leadingWidth: 20,
        title: ListTile(
          title: Text(chatroomitem.name),
          leading: CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesSammed),),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('ChatRoom').doc(
                      chatroomitem.id).collection('messages').orderBy('date').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      myappController.getMessages(snapshot.data);
                      return ListView.builder(
                        itemCount: myappController.chatmessages.length,
                        itemBuilder: (BuildContext context, int index) {
                          Message_model item = myappController.chatmessages
                              .value[index];
                          return MessageBubble(item: item,
                            user: item.createdby ==
                                myappController.currentUser.userid,);
                        },);
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  })),

          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(6.0),
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 7,
                            color: Colors.grey)
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: myappController.textcontroller.value,
                            decoration: InputDecoration(
                                hintText: "Message",
                                hintStyle: TextStyle(color: Color(0xFF00BFA5)),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Obx(() {
                  return FloatingActionButton(
                    onPressed: () async {
                      if (myappController.textcontroller.value.text == '') return;
                      Message_model mes = Message_model(content: myappController.textcontroller.value
                          .text, type: 'text', createdby: myappController
                          .currentUser.userid, date: DateTime.now());
                      await myappController.sendMessage(chatroomitem.id, mes);
                      myappController.textcontroller.value.text = '';
                    },
                    child: myappController.textcontroller.value.text != '' ? Icon(
                      Icons.send, color: Colors.white,) : Icon(Icons.mic),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  Message_model item;
  final bool user;

  MessageBubble({ required this.item, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: !user ? Colors.white : Colors.teal.withOpacity(0.2),
                width: 2.0),
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.content,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
              Text(
                myDateTime(item.date),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
