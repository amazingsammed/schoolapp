import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/controllers/localcontroller.dart';
import 'package:schoolapp/models/user_model.dart';

import '../../widgets/constants.dart';

class EditProfilePage extends StatelessWidget {
  UserX user;
  TextEditingController nameController = TextEditingController();

  // TextEditingController emailController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  // TextEditingController imageController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(onTap: () async {
              myappController.postimage.value =
                  await myappController.getImageAndSave(gallery: true);
            }, child: Obx(() {
              return CircleAvatar(
                radius: 80,
                backgroundImage: appImage(myappController.postimage.value),
              );
            })),
            kSizedbox30,
            KTextField(
              controller: nameController,
              hintext: 'Full Name',
              icon: Icons.person_2,
            ),
            kSizedbox20,
            kDropDown(
              item: ["high school", 'college', 'University'],
              labeltext: 'School',
              initialValue: 'college',
              onChange: (val) {
                schoolController.text = val.toString();
              },
            ),
            kSizedbox20,
            KTextField(
                controller: aboutController,
                hintext: 'about',
                icon: Icons.info_outline),
            kSizedbox30,
            ElevatedButton(
                onPressed: () {
                  UserX userm = UserX(
                      email: user.email,
                      name: nameController.text,
                      image: myappController.postimage.value,
                      userid: user.userid);
                  myappController.updateUserinfo(userm);
                  Get.back();
                },
                child: Text('Update'))
          ],
        ),
      ),
    );
  }
}
