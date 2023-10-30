
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:schoolapp/controllers/appcontroller.dart';

import 'package:schoolapp/screens/chat/chathome.dart';
import 'package:schoolapp/screens/post/profile.dart';

import '../widgets/colors.dart';
import 'home.dart';


class Master extends StatelessWidget {
  Master({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Home(),
      ChatHome(),
      // SavesPage(),
      Profile(),
      // AccountPage(),
    ];

    return Scaffold(
      body: Obx(() =>
          IndexedStack(index: myappController.tabIndex.value, children: screens)),
      bottomNavigationBar: Obx(() {
        var activecolor = Colors.orange;
        var inactiveColor = Colors.white30;
        return FlashyTabBar(
          selectedIndex: myappController.tabIndex.value,
          animationCurve: Curves.linear,
          showElevation: true,
          backgroundColor: kColorz.DrawerBlueGrey,
          animationDuration: const Duration(milliseconds: 250),
          iconSize: 27.5,
          height: 55,
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.home_filled),
              activeColor: activecolor,
              inactiveColor: inactiveColor,
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.chat_bubble),
              activeColor: activecolor,
              inactiveColor: inactiveColor,
              title: const Text(
                'Chat',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            // FlashyTabBarItem(
            //   icon: Icon(MdiIcons.bookmark),
            //   activeColor: activecolor,
            //   inactiveColor: inactiveColor,
            //   title: const Text(
            //     'Saves',
            //     style: TextStyle(
            //       fontSize: 15,
            //     ),
            //   ),
            // ),
            FlashyTabBarItem(
              icon: Icon(Icons.person),
              activeColor: activecolor,
              inactiveColor: inactiveColor,
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
          onItemSelected: myappController.changeTabindex,
        );
      }),
    );
  }
}
