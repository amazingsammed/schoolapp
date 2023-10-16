import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:schoolapp/models/news_model.dart';
import 'package:schoolapp/screens/resultpage.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../controllers/notification_services.dart';
import '../models/timetable_model.dart';
import '../models/user_model.dart';
import '../widgets/constants.dart';
import '../widgets/kcontainers.dart';
import '../widgets/ktexts.dart';
import 'components/drawer_item.dart';
import 'components/eventcontainer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'mentorscreen.dart';


class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () async {
                Get.to(()=>MentorHome());

                // await NotificationService().sheduledNotification(
                //     task: TimeTable(
                //         title: 'title',
                //         time: TimeOfDay(hour: 8, minute: 45),
                //         dayintext: 'Friday'));
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: DrawerItem(),
      body: SingleChildScrollView(
        padding: kPadding20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: KText(
                'Hi, ${student.firstname}',
                fontsize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            kSizedbox10,
            KText('Your next lesson is '),
            kSizedbox10,
            SizedBox(
                height: 80,
                width: double.maxFinite,
                child: ContainerWithTwoText(
                  title: 'Accounting',
                  subtile: 'Class : BLT 200',
                )),
            kSizedbox10,
            Row(
              children: [
                ContainerWithIcon(
                  title: 'Handouts',
                  icon: Icons.book_outlined,
                  index: 2,
                ),
                kSizedbox10,
                ContainerWithIcon(
                  title: 'Past Questions',
                  icon: Icons.note_alt_outlined,
                  index: 1,
                ),
              ],
            ),
            kSizedbox10,
            Row(
              children: [
                ContainerWithIcon(
                  title: 'Mentor',
                  icon: Icons.event,
                  index: 0,
                ),
                kSizedbox10,
                ContainerWithIcon(
                  title: 'School Activities',
                  icon: Icons.timeline,
                  index: 4,
                ),
              ],
            ),
            kSizedbox10,
            Row(
              children: [
                ContainerWithIcon(
                  title: 'About School',
                  icon: Icons.note_alt_outlined,
                  index: 1,
                ),
              ],
            ),
            kSizedbox20,
            KText(
              'News',
              fontsize: 28,
              fontWeight: FontWeight.bold,
            ),
            kSizedbox20,
            events.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text('No News Avaliable'),
                  )
                : !Responsive.isMobile(context)
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: events.length,
                        itemBuilder: (BuildContext context, int index) {
                          return EventContainer(
                              image: events[index].image,
                              userimage: events[index].userimage,
                              time: events[index].starttime,
                              title: events[index].title,
                              avenue: events[index].avenue);
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 300,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: events.length,
                        itemBuilder: (BuildContext context, int index) {
                          return EventContainer(
                              image: events[index].image,
                              userimage: events[index].userimage,
                              time: events[index].starttime,
                              title: events[index].title,
                              avenue: events[index].avenue);
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            kSizedbox10,
                      )
          ],
        ),
      ),
    );
  }
}
