import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:schoolapp/screens/home.dart';
import 'package:schoolapp/screens/profile.dart';
import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/constants.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../../models/drawer_menu.dart';
import '../../models/user_model.dart';
import '../resultpage.dart';
import '../timetable.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Drawer(
          backgroundColor: kColorz.DrawerBlack,
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  textColor: Colors.white,
                  tileColor: kColorz.DrawerBlueGrey,
                  leading: CircleAvatar(
                    backgroundImage: student.image == null
                        ? null
                        : AssetImage(student.image as String),
                    backgroundColor: Colors.white,
                    child: student.image == null ? Icon(Icons.person) : null,
                  ),
                  title: Text('${student.name} ${student.surname}'),
                  subtitle: Text('Computerized ${student.course} Student'),
                ),
                kSizedbox20,
                Expanded(
                  child: ListView.builder(
                      itemCount: draweritems.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == draweritems.length) {
                          return Center(
                              child: Text(
                            'version: 1.0.1',
                            style: TextStyle(color: Colors.white60),
                          ));
                        } else if (draweritems[index].submenus == null) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Get.to(() => Home());
                              } else if (index == 1) {
                                Get.to(() => Profile());
                              } else if (index == 3) {
                                Get.to(() => ResultsPage());
                              } else {}
                            },
                            child: ListTile(
                              iconColor: Colors.white,
                              leading: Icon(draweritems[index].icon),
                              title: Text(
                                draweritems[index].title,
                                style: TextStyle(color: Colors.white),
                              ),
                              textColor: Colors.white,
                            ),
                          );
                        } else {
                          return ExpansionTile(
                              collapsedIconColor: Colors.white,
                              collapsedTextColor: Colors.white,
                              leading: Icon(draweritems[index].icon),
                              title: Text(draweritems[index].title),
                              textColor: Colors.white,
                              children: draweritems[index]
                                  .submenus
                                  ?.map((e) => InkWell(
                                        onTap: () {
                                          print(DateTime.friday);
                                          Get.to(() => TimeTablePage(
                                                day: e,
                                              ));
                                        },
                                        child: Container(
                                            margin: kPadding10.copyWith(
                                                bottom: 5, top: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: kColorz.DrawerBlueGrey),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: double.maxFinite,
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ))
                                  .toList() as List<InkWell>);
                        }
                      }),
                ),
                ListTile(
                  textColor: Colors.white,
                  tileColor: kColorz.DrawerBlueGrey,
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  title: Text('ABC Technical University'),
                  subtitle: Text('Computerized ${student.course}'),
                ),
              ],
            ),
          ),
        ),
        desktop: Container(
          color: kColorz.DrawerBlack,
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  textColor: Colors.white,
                  tileColor: kColorz.DrawerBlueGrey,
                  leading: CircleAvatar(
                    backgroundImage: student.image == null
                        ? null
                        : AssetImage(student.image as String),
                    backgroundColor: Colors.white,
                    child: student.image == null ? Icon(Icons.person) : null,
                  ),
                  title: Text('${student.name} ${student.surname}'),
                  subtitle: Text('Computerized ${student.course} Student'),
                ),
                kSizedbox20,
                Expanded(
                  child: ListView.builder(
                      itemCount: draweritems.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == draweritems.length) {
                          return Center(
                              child: Text(
                            'version: 1.0.1',
                            style: TextStyle(color: Colors.white60),
                          ));
                        } else if (draweritems[index].submenus == null) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Get.to(() => Home());
                              } else if (index == 1) {
                                Get.to(() => Profile());
                              } else if (index == 3) {
                                Get.to(() => ResultsPage());
                              } else {}
                            },
                            child: ListTile(
                              iconColor: Colors.white,
                              leading: Icon(draweritems[index].icon),
                              title: Text(
                                draweritems[index].title,
                                style: TextStyle(color: Colors.white),
                              ),
                              textColor: Colors.white,
                            ),
                          );
                        } else {
                          return ExpansionTile(
                              collapsedIconColor: Colors.white,
                              collapsedTextColor: Colors.white,
                              leading: Icon(draweritems[index].icon),
                              title: Text(draweritems[index].title),
                              textColor: Colors.white,
                              children: draweritems[index]
                                  .submenus
                                  ?.map((e) => InkWell(
                                        onTap: () {
                                          print(DateTime.friday);
                                          Get.to(() => TimeTablePage(
                                                day: e,
                                              ));
                                        },
                                        child: Container(
                                            margin: kPadding10.copyWith(
                                                bottom: 5, top: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: kColorz.DrawerBlueGrey),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: double.maxFinite,
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ))
                                  .toList() as List<InkWell>);
                        }
                      }),
                ),
                ListTile(
                  textColor: Colors.white,
                  tileColor: kColorz.DrawerBlueGrey,
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  title: Text('ABC Technical University'),
                  subtitle: Text('Computerized ${student.course}'),
                ),
              ],
            ),
          ),
        ));
    return Container(
      color: kColorz.DrawerBlack,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              textColor: Colors.white,
              tileColor: kColorz.DrawerBlueGrey,
              leading: CircleAvatar(
                backgroundImage: student.image == null
                    ? null
                    : AssetImage(student.image as String),
                backgroundColor: Colors.white,
                child: student.image == null ? Icon(Icons.person) : null,
              ),
              title: Text('${student.name} ${student.surname}'),
              subtitle: Text('Computerized ${student.course} Student'),
            ),
            kSizedbox20,
            Expanded(
              child: ListView.builder(
                  itemCount: draweritems.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == draweritems.length) {
                      return Center(
                          child: Text(
                        'version: 1.0.1',
                        style: TextStyle(color: Colors.white60),
                      ));
                    } else if (draweritems[index].submenus == null) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            Get.to(() => Home());
                          } else if (index == 1) {
                            Get.to(() => Profile());
                          } else if (index == 3) {
                            Get.to(() => ResultsPage());
                          } else {}
                        },
                        child: ListTile(
                          iconColor: Colors.white,
                          leading: Icon(draweritems[index].icon),
                          title: Text(
                            draweritems[index].title,
                            style: TextStyle(color: Colors.white),
                          ),
                          textColor: Colors.white,
                        ),
                      );
                    } else {
                      return ExpansionTile(
                          collapsedIconColor: Colors.white,
                          collapsedTextColor: Colors.white,
                          leading: Icon(draweritems[index].icon),
                          title: Text(draweritems[index].title),
                          textColor: Colors.white,
                          children: draweritems[index]
                              .submenus
                              ?.map((e) => InkWell(
                                    onTap: () {
                                      print(DateTime.friday);
                                      Get.to(() => TimeTablePage(
                                            day: e,
                                          ));
                                    },
                                    child: Container(
                                        margin: kPadding10.copyWith(
                                            bottom: 5, top: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: kColorz.DrawerBlueGrey),
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: double.maxFinite,
                                        child: Text(
                                          e,
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ))
                              .toList() as List<InkWell>);
                    }
                  }),
            ),
            ListTile(
              textColor: Colors.white,
              tileColor: kColorz.DrawerBlueGrey,
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
              ),
              title: Text('ABC Technical University'),
              subtitle: Text('Computerized ${student.course}'),
            ),
          ],
        ),
      ),
    );
  }
}
