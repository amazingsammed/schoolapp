import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/sharedpref.dart';
import 'package:schoolapp/models/timetable_model.dart';
import 'package:schoolapp/screens/auth/auth.dart';
import 'package:schoolapp/screens/home.dart';

import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/timex.dart';

import 'controllers/notification_services.dart';

import 'package:timezone/data/latest.dart' as tz;


void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AppController());
  //await NotificationService().initNotification();
  //await AndroidAlarmManager.initialize();
 // tz.initializeTimeZones();
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown

  ]);

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kColorz.DrawerBlueGrey,
          appBarTheme: AppBarTheme(backgroundColor: kColorz.DrawerBlueGrey)),
      home: AuthScreen(),
    );
  }
}
