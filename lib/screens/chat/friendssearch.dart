import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/widgets/constants.dart';

import '../../controllers/appcontroller.dart';
import '../../models/user_model.dart';

class FSearchPage extends StatelessWidget {
  const FSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Find Others'),
      ),
      body: SafeArea(
        child: Column(children: [
          kSizedbox20,
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.black12),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              padding: EdgeInsets.all(5),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none),
                onFieldSubmitted: (vas) async {
                  await myappController.fsearchfriends(vas);
                },
              )),
          Divider(),
          kSizedbox20,
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: myappController.fsearchlist.value.length,
                itemBuilder: (BuildContext context, int index) {
                  UserX item = myappController.fsearchlist.value[index];
                  return InkWell(
                      child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.black12,
                        backgroundImage: item.image == ''
                            ? AssetImage(
                                "assets/images/no_img.png",
                              )
                            : AssetImage(item.image)),
                    title: Text(item.name),
                  ));
                },
              );
            }),
          ),
        ]),
      ),
    );
  }
}
