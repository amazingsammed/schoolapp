


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../widgets/constants.dart';

class NumAndText extends StatelessWidget {
  String text;
  String num;
   NumAndText({Key? key,required this.num,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Expanded(child: Column(
    children: [
    Text(num,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
    kSizedbox5,
    Text(text,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold))
    ],
    ));
  }
}


class ProfileButton extends StatelessWidget {
  bool filled;
  String text;
  Function()? ontap;
  ProfileButton({Key? key,this.filled = false,required this.text,this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.purple),
            color: !filled?Colors.white:Colors.purple
          ),
          child: Text(text,style: TextStyle(color: filled?Colors.white:Colors.purple),),
        ),
      ),
    );
  }
}

