import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/constants.dart';
import 'package:schoolapp/widgets/ktexts.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../models/user_model.dart';
import '../widgets/kcontainers.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Responsive(
          mobile: Container(
            padding: kPadding20,
            child: Column(
              children: [
                ContainerWithBorder(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: kPadding10,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          textColor: Colors.white,
                          leading: SafeArea(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: student.image == null
                                    ? null
                                    : DecorationImage(
                                        image:
                                            AssetImage(student.image as String),
                                      ),
                              ),
                              child: student.image == null
                                  ? Icon(Icons.person)
                                  : null,
                            ),
                          ),
                          title: Text('${student.firstname} ${student.surname}'),
                          subtitle:
                              Text('Computerized ${student.course} Student'),
                        ),
                      ),
                      kSizedbox20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kSizedbox10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${student.course_code}'.toUpperCase()),
                              Text('Course'.capitalizeFirst.toString()),
                            ],
                          ),
                          kSizedbox20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${student.level}'.toUpperCase()),
                              Text('level'.capitalizeFirst.toString()),
                            ],
                          ),
                          kSizedbox20,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${student.classs}'.toUpperCase()),
                              Text('class'.capitalizeFirst.toString()),
                            ],
                          ),
                          kSizedbox10
                        ],
                      )
                    ],
                  ),
                ),
                kSizedbox10,
                ContainerWithBorder(
                    child: ContainerWithColumn(
                  title: 'Personal',
                  children: [
                    ListTile(
                        title: Text('${student.firstname} ${student.surname}'),
                        subtitle: Text2small('full name')),
                    ListTile(
                        title: Text(student.ismale ? 'Male' : 'female'),
                        subtitle: Text2small('sex')),
                    ListTile(
                        title: Text('${student.age}'),
                        subtitle: Text2small('Age')),
                    ListTile(
                        title: Text('${student.phone}'),
                        subtitle: Text2small('phone')),
                  ],
                )),
                kSizedbox10,
                ContainerWithBorder(
                    child: ContainerWithColumn(
                  title: 'School Details',
                  children: [
                    ListTile(
                        title: Text('${student.course_code}'),
                        subtitle: Text2small('course code')),
                    ListTile(
                        title: Text('${student.course} with Computing'),
                        subtitle: Text2small('course')),
                    ListTile(
                        title: Text('${student.level}'),
                        subtitle: Text2small('level')),
                    ListTile(
                        title: Text('${student.classs}'),
                        subtitle: Text2small('Class')),
                  ],
                )),
                kSizedbox10,
                ContainerWithBorder(
                    child: ContainerWithColumn(
                  title: 'Guardian Details',
                  children: [
                    ListTile(
                        title: Text('${student.guardian_name}'),
                        subtitle: Text('full name')),
                    ListTile(
                        title: Text('${student.guardian_occupation}'),
                        subtitle: Text2small('occupation')),
                    ListTile(
                        title: Text('${student.guardian_location}'),
                        subtitle: Text2small('location')),
                    ListTile(
                        title: Text('${student.guardian_phone}'),
                        subtitle: Text2small('phone')),
                  ],
                ))
              ],
            ),
          ),
          desktop: Container(
            padding: kPadding20,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ContainerWithBorder(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: kPadding10,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                textColor: Colors.white,
                                leading: SafeArea(
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: student.image == null
                                          ? null
                                          : DecorationImage(
                                              image: AssetImage(
                                                  student.image as String),
                                            ),
                                    ),
                                    child: student.image == null
                                        ? Icon(Icons.person)
                                        : null,
                                  ),
                                ),
                                title:
                                    Text('${student.firstname} ${student.surname}'),
                                subtitle: Text(
                                    'Computerized ${student.course} Student'),
                              ),
                            ),
                            kSizedbox20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kSizedbox10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        '${student.course_code}'.toUpperCase()),
                                    Text('Course'.capitalizeFirst.toString()),
                                  ],
                                ),
                                kSizedbox20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${student.level}'.toUpperCase()),
                                    Text('level'.capitalizeFirst.toString()),
                                  ],
                                ),
                                kSizedbox20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${student.classs}'.toUpperCase()),
                                    Text('class'.capitalizeFirst.toString()),
                                  ],
                                ),
                                kSizedbox10
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    kSizedbox10,
                    Expanded(
                      child: ContainerWithBorder(
                          child: ContainerWithColumn(
                        title: 'Personal',
                        children: [
                          ListTile(
                              title: Text('${student.firstname} ${student.surname}'),
                              subtitle: Text2small('full name')),
                          ListTile(
                              title: Text(student.ismale ? 'Male' : 'female'),
                              subtitle: Text2small('sex')),
                          ListTile(
                              title: Text('${student.age}'),
                              subtitle: Text2small('Age')),
                          ListTile(
                              title: Text('${student.phone}'),
                              subtitle: Text2small('phone')),
                        ],
                      )),
                    ),
                  ],
                ),
                kSizedbox10,
                Row(
                  children: [
                    Expanded(
                      child: ContainerWithBorder(
                          child: ContainerWithColumn(
                        title: 'School Details',
                        children: [
                          ListTile(
                              title: Text('${student.course_code}'),
                              subtitle: Text2small('course code')),
                          ListTile(
                              title: Text('${student.course} with Computing'),
                              subtitle: Text2small('course')),
                          ListTile(
                              title: Text('${student.level}'),
                              subtitle: Text2small('level')),
                          ListTile(
                              title: Text('${student.classs}'),
                              subtitle: Text2small('Class')),
                        ],
                      )),
                    ),
                    kSizedbox10,
                    Expanded(
                      child: ContainerWithBorder(
                          child: ContainerWithColumn(
                        title: 'Guardian Details',
                        children: [
                          ListTile(
                              title: Text('${student.guardian_name}'),
                              subtitle: Text('full name')),
                          ListTile(
                              title: Text('${student.guardian_occupation}'),
                              subtitle: Text2small('occupation')),
                          ListTile(
                              title: Text('${student.guardian_location}'),
                              subtitle: Text2small('location')),
                          ListTile(
                              title: Text('${student.guardian_phone}'),
                              subtitle: Text2small('phone')),
                        ],
                      )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
