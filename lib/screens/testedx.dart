

import 'package:flutter/material.dart';

class Tested extends StatelessWidget {
  String data;
  Tested(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('asdsad'),),

      body: SingleChildScrollView(child: SelectableText( data)),
    );
  }
}
