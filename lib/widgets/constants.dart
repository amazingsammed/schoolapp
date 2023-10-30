import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../generated/assets.dart';

EdgeInsets kPadding20 = const EdgeInsets.all(20);
EdgeInsets kPadding10 = const EdgeInsets.all(10);

SizedBox kSizedbox10 = const SizedBox(
  height: 10,
  width: 10,
);
SizedBox kSizedbox30 = const SizedBox(
  height: 30,
  width: 30,
);



SizedBox kSizedbox20 = const SizedBox(
  height: 20,
  width: 20,
);

SizedBox kSizedbox5 = const SizedBox(
  height: 5,
  width: 5,
);

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.060,
  fontWeight: FontWeight.bold,
);

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.030,
);

String myDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final yesterday = now.subtract(Duration(days: 1));

  if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day) {
    // The date is today, so return the time in 12-hour clock format with AM/PM.
    final timeFormat = DateFormat.jm();
    return "today ${timeFormat.format(dateTime)}";
  } else if (dateTime.year == yesterday.year && dateTime.month == yesterday.month && dateTime.day == yesterday.day) {
    // The date is yesterday, so return "Yesterday" as text.
    return 'Yesterday';
  } else {
    // For other dates, return the date in the format dd:MM:yyyy.
    final dateFormat = DateFormat('dd:MM:yyyy');
    return "${dateFormat.format(dateTime)}";
  }
}

ImageProvider appImage(String? image) {
  if(image =='')return AssetImage(Assets.imagesNoimg);
  if (image!.contains('data/user')) {
    return Image.file(
    File(image.toString()),
    fit: BoxFit.cover,
  ).image;
  } else {
    return NetworkImage(image);
  }
}



class KTextField extends StatelessWidget {
  IconData icon;
  TextEditingController controller;
  String hintext;
   KTextField({Key? key,required this.hintext,required this.controller,this.icon =Icons.home_max}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon:  Icon(icon),
        hintText: hintext,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintext';
        } else if (value.length < 4) {
          return 'at least enter 3 characters';
        }
        return null;
      },
    );
  }
}

class kDropDown extends StatelessWidget {
  String labeltext;

  List<String> item;
  String initialValue;
  Function(Object?)? onChange;
  kDropDown({Key? key,required this.item,this.onChange,required this.labeltext,required this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labeltext,style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          SizedBox(
           // height: 50,width: 250,
            child: FormBuilderDropdown(
              initialValue: initialValue,
              name: 'options',
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),),

              ),
              onChanged: onChange,
              items: item.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              // items: const [
              //   DropdownMenuItem(value: 0, child: Text('Show textfield')),
              //   DropdownMenuItem(value: 1, child: Text('Show info text')),
              // ],
            ),
          ),

        ],
      ),
    );
  }
}
