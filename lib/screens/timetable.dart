import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/constants.dart';

import '../models/timetable_model.dart';

class TimeTablePage extends StatelessWidget {
  String day;
  TimeTablePage({required this.day, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TimeTable> newtable = timetable
        .where((element) => element.day.toLowerCase() == day.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons for ${day.capitalizeFirst}'),
      ),
      body: Container(
        margin: kPadding20.copyWith(top: 0),
        child: newtable.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: Text('No lessons for this Day'),
              )
            : ListView.separated(
                itemCount: newtable.length,
                itemBuilder: (BuildContext context, int index) {
                  TimeTable element = newtable[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kColorz.DrawerBlueGrey,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(element.subjectname),
                      subtitle: Text(element.classs.toUpperCase()),
                      trailing: Text(element.time),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    kSizedbox10),
      ),
    );
  }
}
