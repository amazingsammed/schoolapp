import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
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
TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();

  TextEditingController starttime = TextEditingController();

  TextEditingController endtime = TextEditingController();

  TextEditingController day = TextEditingController();

  final _days = [
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
                    time: myappController.time.value,
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
            Container(
              height: 150,
              margin: EdgeInsets.all(20),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title.text.capitalizeFirst.toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                              kSizedbox10,
                              Text(day.text),
                            ],
                          ),
                          kSizedbox20,
                          Text(
                            DateFormat.jm()
                                .format(DateTime(
                                    2023,
                                    1,
                                    2,
                                myappController.time.value.hour,
                                myappController.time.value.minute))
                                .toString(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      Icon(myappController.isactive.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  kSizedbox10,
                  // TextFormField(
                  //   controller: description,
                  //   decoration: InputDecoration(
                  //     labelText: 'Description',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //       borderSide: const BorderSide(
                  //         width: 0,
                  //         style: BorderStyle.solid,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Card(
                    child: ListTile(
                      onTap: () async {
                       myappController.time.value= (await showTimePicker(
                            context: context, initialTime: TimeOfDay.now()))!;
                      },
                      title: const Text('Time'),
                      trailing: SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text( DateFormat.jm()
                                .format(DateTime(
                                2023,
                                1,
                                2,
                                myappController.time.value.hour,
                                myappController.time.value.minute))
                                .toString()),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                  kSizedbox10,
                  Card(
                    child: ListTile(
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
