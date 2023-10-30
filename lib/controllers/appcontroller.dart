

import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/controllers/sharedpref.dart';
import 'package:schoolapp/models/message.dart';
import 'package:schoolapp/models/timetable_model.dart';

import '../models/user_model.dart';


AppController myappController = AppController.instance;
class AppController extends GetxController{
  static AppController instance = Get.find();
  var textcontroller=TextEditingController().obs;
  var currentUserList = <UserX>[].obs;
  var chatroom=<ChatRoom>[].obs;
  var chatmessages = <Message_model>[].obs;
  UserX get currentUser => currentUserList.value[0];
  var tabIndex = 0.obs;
  var startup = false.obs;
  var postimage=''.obs;
  var fsearchlist =<UserX>[].obs;


  var mypostCount = 0.obs;

  void changeTabindex(int index) {
    FocusManager.instance.primaryFocus!.unfocus();
    tabIndex.value = index;
  }

  var islogin = false.obs;
  var hour = 0.obs;
  var min = 0.obs;
  var isam =0.obs;
  var isactive = true.obs;
  var time = TimeOfDay.now().obs;
  var myCurrentSubject =<TimeTable>[].obs;
  var myTimeList=<TimeTable>[].obs;
  addTime(TimeTable item){

    myTimeList.add(item);
    updateListInSharedPreferences();
  }
  deleteTime(TimeTable item){

    myTimeList.remove(item);
    updateListInSharedPreferences();
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await getSharedPreferences();
    await getCurrentUser();
    //await AndroidAlarmManager.periodic(const Duration(minutes: 1), Random().nextInt(pow(2, 31) as int), myappController.updateMyTimeTableText());
    super.onInit();
  }


}