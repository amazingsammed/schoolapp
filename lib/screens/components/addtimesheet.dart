import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/models/timetable_model.dart';

import '../../controllers/notification_services.dart';
import '../../widgets/constants.dart';
import '../../widgets/timex.dart';

class AddTimeSheet extends StatefulWidget {
  AddTimeSheet({Key? key}) : super(key: key);

  @override
  State<AddTimeSheet> createState() => _AddTimeSheetState();
}

class _AddTimeSheetState extends State<AddTimeSheet> {
  TextEditingController title = TextEditingController();

  TextEditingController starttime = TextEditingController();

  TextEditingController endtime = TextEditingController();

  TextEditingController day = TextEditingController();

  final  _days = [
    'Sunday',
    'Monday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text('Add Time Sheet item'),
        actions: [
          IconButton(
              onPressed: () async {
                TimeTable item = TimeTable(
                    title: title.text.trim(),
                    time: TimeOfDay(
                        hour: myappController.isam.value == 0?myappController.hour.value:myappController.hour.value+12,
                        minute: myappController.min.value),
                    dayintext: day.text.trim());
                myappController.addTime(item);
                await NotificationService().sheduledNotification(task: item);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyTimer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.defaultDialog(
                          content: TextFormField(
                            controller: title,
                            decoration:
                                const InputDecoration(hintText: 'Enter title here.......'),
                          ),
                          title: 'Title',
                          textConfirm: 'done',
                          textCancel: 'cancel',
                          onConfirm: () {
                            setState(() {
                              title.text = title.text;
                              Navigator.of(context).pop();
                            });
                          });
                    },
                    title: const Text('Title'),
                    trailing: SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(title.text),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                  kSizedbox10,
                  ListTile(
                    onTap: () async {
                      Get.bottomSheet(Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: ListView.builder(
                            itemCount: _days.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  margin: kPadding10,
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        day.text = _days[index];
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    title: Container(
                                        width: double.maxFinite,
                                        padding: kPadding10,
                                        child: Text(_days[index])),
                                  ));
                            },
                          ),
                        ),
                      ));
                    },
                    title: Text('Days'),
                    trailing: SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(day.text ?? ""),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
