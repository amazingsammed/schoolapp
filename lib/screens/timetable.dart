import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/sharedpref.dart';
import 'package:schoolapp/widgets/constants.dart';

import '../models/timetable_model.dart';
import 'components/addtimesheet.dart';

class TimeTablePage extends StatelessWidget {
  TimeTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Sheet'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: myappController.myTimeList.value.length,
          itemBuilder: (BuildContext context, int index) {
            TimeTable item = myappController.myTimeList.value[index];
            return InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // InkWell(
                      //     onTap: () {
                      //
                      //     },
                      //     child: ListTile(
                      //       leading: Icon(Icons.edit),
                      //       title: Text('Edit'),
                      //     )),
                      SizedBox(
                          child: InkWell(
                              onTap: () {
myappController.deleteTime(item);

                              },
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ))),
                      SizedBox(
                          child: InkWell(
                              onTap: () {
                                myappController.myTimeList.value[index].isActive =
                                !myappController.myTimeList.value[index].isActive;
                                myappController.updateListInSharedPreferences();
                                myappController.myTimeList.refresh();
                              },
                              child: ListTile(
                                leading: Icon(Icons.desktop_access_disabled),
                                title: Text('Enable or Disable'),
                              ))),
                    ],
                  ),
                ));
              },
              // onLongPress: () {
              //   myappController.myTimeList.value[index].isActive =
              //   !myappController.myTimeList.value[index].isActive;
              //   myappController.myTimeList.refresh();
              // },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Obx(() {
                  return Card(
                    color: myappController.myTimeList.value[index].isActive
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  kSizedbox10,
                                  Text(item.dayintext),
                                ],
                              ),
                              kSizedbox20,
                              Text(
                                DateFormat.jm()
                                    .format(DateTime(2023, 1, 2, item.time.hour,
                                        item.time.minute))
                                    .toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                          Icon(item.isActive
                              ? Icons.check_box
                              : Icons.check_box_outline_blank)
                        ],
                      ),
                    ),
                  );
            },
        )));});}),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTimeSheet(), fullscreenDialog: true);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
