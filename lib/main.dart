import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:schoolapp/screens/home.dart';
import 'package:schoolapp/widgets/colors.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
