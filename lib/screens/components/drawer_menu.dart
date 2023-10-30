import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/enums.dart';

class DrawerModel {
  //complex drawer menu
  final IconData icon;
  final String title;
  List<String>? submenus = [];

  DrawerModel({required this.icon, required this.title, this.submenus});
}

List<DrawerModel> draweritems = [
  DrawerModel(icon: Icons.person, title: 'Profile'),
  // DrawerModel(icon: Icons.timelapse_outlined, title: 'Timetable', submenus: [
  //   'Sunday',
  //   'Monday',
  //   'Tuesday',
  //   'Wednesday',
  //   'Thursday',
  //   'Friday',
  //   'Saturday'
  // ]),
  DrawerModel(icon: Icons.timelapse_outlined, title: 'Timetable'),
  DrawerModel(
    icon: Icons.bookmarks,
    title: 'Results',
  ),
  DrawerModel(icon: Icons.logout, title: 'Logout'),
];
