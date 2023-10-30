


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/models/user_model.dart';

class ProfileTile1 extends StatelessWidget {
  UserX item;
  Function()? ontap;
   ProfileTile1({Key? key,required this.item,this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: CircleAvatar(),
        title: Text(item.name),
      ),
    );
  }
}
