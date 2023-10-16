import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/models/timetable_model.dart';
import 'package:schoolapp/screens/home.dart';

import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/timex.dart';

import 'controllers/notification_services.dart';

import 'package:timezone/data/latest.dart' as tz;


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppController());
  await NotificationService().initNotification();
  tz.initializeTimeZones();
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown

  ]);

  runApp( MyApp());
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
      home: Home(),
    );
  }
}
