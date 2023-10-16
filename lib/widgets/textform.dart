import 'package:flutter/material.dart';

class TextwithForm extends StatelessWidget {
  String data;
  String hinttext;
  var controller;
  TextwithForm(
      {Key? key,
      required this.data,
      this.hinttext = '',
      this.controller = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.toString().toUpperCase(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: hinttext,
              hintText: hinttext,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
        ),
      ],
    );
  }
}

List abc = [];
