import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:schoolapp/models/news_model.dart';
import 'package:schoolapp/screens/resultpage.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../models/user_model.dart';
import '../widgets/constants.dart';
import '../widgets/kcontainers.dart';
import '../widgets/ktexts.dart';
import 'components/drawer_item.dart';
import 'components/eventcontainer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !Responsive.isMobile(context)
          ? null
          : AppBar(
              elevation: 0,
              title: Text('Home'),
            ),
      drawer: !Responsive.isMobile(context) ? null : DrawerItem(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !Responsive.isMobile(context)
              ? SizedBox(
                  width: 400,
                  child: DrawerItem(),
                  height: double.maxFinite,
                )
              : Container(),
          Expanded(
            child: SingleChildScrollView(
              padding: kPadding20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //padding: kPadding10,
                    child: KText(
                      'Greetings ,\n${student.name}',
                      fontsize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  KText('Your next lesson is '),
                  kSizedbox10,
                  ContainerWithCenter(
                    height: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        KText(
                          'Accounting',
                          fontsize: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [KText('Class : '), KText('BLT 200')],
                        )
                      ],
                    ),
                  ),
                  kSizedbox20,
                  Row(
                    children: [
                      Expanded(
                        child: ContainerWithCenter(
                            ontap: () {
                              Get.to(() => ResultsPage());
                            },
                            height: 90,
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.checklist,
                                  size: 40,
                                ),
                                kSizedbox10,
                                KText('Check Result'),
                              ],
                            )),
                      ),
                      kSizedbox20,
                      Expanded(
                          child: ContainerWithCenter(
                              height: 90,
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.payment_outlined,
                                    size: 40,
                                  ),
                                  kSizedbox10,
                                  KText('Register Courses'),
                                ],
                              )))
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
                                    time: events[index].time,
                                    title: events[index].title,
                                    avenue: events[index].avenue);
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                                    time: events[index].time,
                                    title: events[index].title,
                                    avenue: events[index].avenue);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      kSizedbox10,
                            )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
