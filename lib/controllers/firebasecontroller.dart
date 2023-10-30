import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/models/message.dart';

import '../models/user_model.dart';

final chatroomcollection = FirebaseFirestore.instance.collection('ChatRoom');
final UserCollection = FirebaseFirestore.instance.collection('User');
final PostCollection = FirebaseFirestore.instance.collection('Post');
final PostBody = FirebaseFirestore.instance.collection('PostBody');

extension FireBaseController on AppController {
  getChatRoom(QuerySnapshot<Map<String, dynamic>> data) async {
    List<ChatRoomitemtype> chroom = [];
    for (var element in data.docs) {
      chroom.add(ChatRoomitemtype.fromMap(element.data()));
    }
    chatroom.value.clear();
    for (var element in chroom) {
      if (element.isgroup == false) {
        element.participant.remove(currentUser.userid);
        var elemnt = await FirebaseFirestore.instance
            .collection('User')
            .doc(element.participant[0])
            .get();
        chatroom.add(ChatRoom(
            imageurl: elemnt.data()?['image'],
            name: elemnt.data()?['name'],
            recentmessage: element.recentmessage,
            time: element.time,
            isgroup: element.isgroup,
            id: myChatId(elemnt.data()?['userid'], currentUser.userid)));
        print(myChatId(elemnt.data()?['userid'], currentUser.userid));
      } else {
        chatroom.add(ChatRoom(
            imageurl: element.groupimage.toString(),
            name: element.groupname.toString(),
            recentmessage: element.recentmessage,
            time: element.time,
            isgroup: element.isgroup,
            id: element.groupid.toString()));
      }
    }

    chatroom.value = chatroom.value.toSet().toList();
  }

  fsearchfriends(String item) async {
    fsearchlist.clear();
    var list =
        await UserCollection.where('name', isGreaterThanOrEqualTo: item).get();
    for (var element in list.docs) {
      fsearchlist.add(UserX.fromMap(element.data()));
    }
    print(fsearchlist.length);
  }

  Future<String?> uploadProfileImage() async {
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('profile_images');

    // Use the image_picker package to pick an image from the device's gallery.
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      // Handle if the user cancels image selection.
      return null;
    }

    File file = File(image.path);
    try {
      UploadTask uploadTask = storageRef.putFile(file);

      // Monitor the upload task.
      await uploadTask.whenComplete(() => null);

      // Get the download URL of the uploaded image.

      String imageUrl = await storageRef.getDownloadURL();

      return imageUrl;
    } catch (e) {
      // Handle any errors that occur during the upload.
      print("Error uploading profile image: $e");
      return null;
    }
  }

  Future<String> uploadImage(image) async {
    if (image == null) {
      // No image to upload
      return '';
    }

    var storageReference =
        FirebaseStorage.instance.ref().child('images/${currentUser.userid}/${image.split('/').last}');

    var task = await storageReference.putFile(File(image));
    return await storageReference.getDownloadURL();
  }
  updateUserinfo(UserX userm) async {
   String image = await uploadImage(userm.image);
userm.image = image;

    FirebaseFirestore.instance
        .collection('User')
        .doc(currentUser.userid)
        .set(userm.toMap());
  }

  uploadPost(
      {required String title,
      required String body,
      required String imageurl}) async {
    var imagename = await uploadImage(imageurl);
    var myid = Random().nextInt(1234567890);
    PostCollection.doc().set({
      'title': title,
      'imageurl': imagename,
      'id': myid,
      'date': Timestamp.fromDate(DateTime.now()),
      'userid': currentUser.userid
    });
    PostBody.doc(currentUser.userid)
        .collection('body')
        .doc()
        .set({'body': body, 'id': myid});
  }

  signUp(UserX myuser) async {
    currentUserList.value.clear();
    currentUserList.refresh;

    UserCredential info = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: myuser.email ?? '', password: myuser.password ?? '');
    //UserCredential info= await FirebaseAuth.instance.signInWithEmailAndPassword(email: myuser.email, password: myuser.password);
    myuser.userid = info.user!.uid;
    FirebaseFirestore.instance
        .collection('User')
        .doc(info.user?.uid)
        .set(myuser.toMap());
    getCurrentUser();
  }

  login(UserX myuser) async {
    currentUserList.value.clear();
    currentUserList.refresh;
    UserCredential info = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: myuser.email, password: myuser.password.toString());
    // DocumentSnapshot data = await FirebaseFirestore.instance
    //     .collection('User')
    //     .doc(info.user?.uid)
    //     .get();
    await getCurrentUser();
  }

  Future<int> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('User')
        .doc(user?.uid)
        .get();
    currentUserList.value
        .add(UserX.fromMap(data.data() as Map<String, dynamic>));
    return currentUserList.length;
  }
   Stream<DocumentSnapshot<Map<String, dynamic>>> getUserStream()  {
    User? user = FirebaseAuth.instance.currentUser;
    var data =  FirebaseFirestore.instance
        .collection('User')
        .doc(user?.uid)
        .snapshots();
    return data;
  }

  Future<UserX> getAuthor(String uID) async {
  var item = await UserCollection.doc(uID).get();
  return UserX.fromMap(item.data()as Map<String, dynamic>);
  }

  String myChatId(String id1, String id2) {
    if (id1.toLowerCase().codeUnits[0] > id2.toLowerCase().codeUnits[0]) {
      return id1 + id2;
    }
    return id2 + id1;
  }

  getMessages(QuerySnapshot<Map<String, dynamic>> data) async {
    chatmessages.clear();
    for (var element in data.docs) {
      chatmessages.add(Message_model.fromMap(element.data()));
    }
  }

  sendMessage(String chatid, Message_model message) async {
    print(chatid);
    await chatroomcollection
        .doc(chatid)
        .collection('messages')
        .doc()
        .set(message.toMap());
    await chatroomcollection
        .doc(chatid)
        .update({'recentmessage': message.content, "time": message.date});
  }
}
