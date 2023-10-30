import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/screens/chat/chatscreen.dart';
import 'package:schoolapp/screens/chat/componets.dart';

import '../../models/user_model.dart';
import 'friendssearch.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Chat'),
        actions: [
          IconButton(onPressed: () async {
            Get.to(()=>FSearchPage());
          }, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ChatRoom')
              .where('participant',
                  arrayContains: myappController.currentUser.userid)
              .orderBy('time')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              myappController.getChatRoom(snapshot.data);
              return Obx(() {
                return ListView.builder(
                  itemCount: myappController.chatroom.length,
                  itemBuilder: (BuildContext context, int index) {
                    ChatRoom item = myappController.chatroom.value[index];
                    return InkWell(
                        onTap: () {
                          Get.to(() => ChatScreen(
                                chatroomitem: item,
                              ));
                        },
                        child: ListTile(
                          leading: CircleAvatar(

                            backgroundColor: Colors.black12,
                              backgroundImage: item.imageurl == ''
                                  ? AssetImage("assets/images/no_img.png",)
                                  : AssetImage(item.imageurl)),
                          title: Text(item.name),
                          subtitle: Text(item.recentmessage),
                          trailing: Text(DateFormat.yMd().format(item.time)),
                        ));
                  },
                );
              });
            } else if (snapshot.hasError) {
              return const Icon(Icons.error_outline);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
