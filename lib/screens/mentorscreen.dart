



import 'package:flutter/material.dart';
import 'package:schoolapp/widgets/constants.dart';

import '../models/mentor.dart';
import '../widgets/kcontainers.dart';

class MentorHome extends StatelessWidget {
  MentorX mentor = MentorX(profileurl: 'profileurl', fullname: 'Sammed Twumasi', topic: 'Accounting', about: 'A Student of kstu, I am at level 400, i have many students', topicdescription: 'topicdescription');
  MentorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(mentor.fullname),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(radius: 70,),
                kSizedbox20,
                Text(mentor.fullname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                kSizedbox10,
                Text("Tutor Course: ${mentor.topic}",style: TextStyle(color: Colors.black.withOpacity(0.7))),
              ],
            ),
            kSizedbox20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About: ${mentor.fullname}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                kSizedbox10,
                Text(mentor.about,style: TextStyle(fontSize: 17)),
              ],
            ),
            kSizedbox20,
            kSizedbox10,
            Row(
              children: [
                ContainerWithIcon2(
                  title: 'Students',
                  icon: Icons.people,
                  total: '16',
                  index: 2,
                ),
                kSizedbox10,
                ContainerWithIcon2(
                  title: 'Completed Topics',
                  icon: Icons.leaderboard,
                  total: '64',
                  index: 1,
                ),
              ],
            ),
            kSizedbox10,
            Row(
              children: [
                ContainerWithIcon2(
                  title: 'Rating',
                  icon: Icons.star_rate,
                  total: '4.3',
                  index: 0,
                ),
                kSizedbox10,
                ContainerWithIcon2(
                  title: 'Activities',
                  icon: Icons.access_time_outlined,
                  total: '1',
                  index: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
