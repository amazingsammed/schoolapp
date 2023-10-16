import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  String text;
  double? fontsize;
  FontWeight? fontWeight;
  KText(this.text, {this.fontsize, Key? key, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontsize, fontWeight: fontWeight),
    );
  }
}

Text Text2small(data) => Text(data.toString().toLowerCase());
