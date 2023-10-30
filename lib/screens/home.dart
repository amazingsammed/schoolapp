import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/sharedpref.dart';
import 'package:schoolapp/generated/assets.dart';
import 'package:schoolapp/models/news_model.dart';
import 'package:schoolapp/screens/post/postpreview.dart';
import 'package:schoolapp/screens/resultpage.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../controllers/firebasecontroller.dart';
import '../controllers/notification_services.dart';
import '../models/articlepost.dart';
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
                'Hi, ${myappController.currentUser.name}',
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
                child: InkWell(
                  onTap: () async {
                    await AndroidAlarmManager.periodic(const Duration(seconds: 3), Random().nextInt(pow(2, 31) as int), ()=>myappController.updateMyTimeTableText());
                  },
                  child: ContainerWithTwoText(
                    title:myappController.myCurrentSubject.value.isEmpty?'Tap Here': myappController.myCurrentSubject.value[0].title,
                    subtile: myappController.myCurrentSubject.value.isEmpty?"If you are a new user":myappController.myCurrentSubject.value[0].dayintext,
                  ),
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
                  title: 'Activities',
                  icon: Icons.timeline,
                  index: 4,
                ),
              ],
            ),
            kSizedbox20,
            KText(
              'Articles',
              fontsize: 28,
              fontWeight: FontWeight.bold,
            ),
            Divider(),
            kSizedbox20,
            StreamBuilder(

                stream: FirebaseFirestore.instance.collection('Post').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot<Map<String, dynamic>> item = snapshot.data;
                    return ListView.separated(itemCount: item.docs.length,
                      separatorBuilder: (cc,ii)=>Divider(),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        ArticlePost itemx = ArticlePost.fromMap(item.docs[index].data());
                        return InkWell(

                            onTap: (){
                              Get.to(()=>PostPreview(item: itemx,));
                            },
                            child: PostItem(item: itemx));
                      },);
                  } else if (snapshot.hasError) {
                    return Icon(Icons.error_outline);
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  ArticlePost item;
  PostItem({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            height: 30,
            child: FutureBuilder(
                future: myappController.getAuthor(item.userid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    UserX item = snapshot.data;
                    return Row(
                      children: [
                        CircleAvatar(radius:15,backgroundImage: appImage(item.image),),
                        kSizedbox10,
                        Text(item.name)
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Icon(Icons.error_outline);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
          Row(
            children: [

              Expanded(child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(item.title,style: TextStyle(
                      fontSize: 20
                  ),),
                  Text('Publised on ${myDateTime(item.date)}',style: TextStyle(
                  ),),
                ],
              )),
              SizedBox(width: 6,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(item.imageurl),
                        fit: BoxFit.cover
                    )
                ),
                height: 60,
                width: 100,

              )
            ],
          )
        ],
      ),
    );
  }
}
