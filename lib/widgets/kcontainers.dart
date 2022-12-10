import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'constants.dart';
import 'colors.dart';

class ContainerWithCenter extends StatelessWidget {
  Widget child;
  AlignmentGeometry alignment;
  bool boxshadow;
  double? height;
  Function()? ontap;
  double? width;
  ContainerWithCenter(
      {required this.child,
      this.alignment = Alignment.center,
      this.height,
      this.ontap,
      this.boxshadow = true,
      this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: alignment,
        height: height,
        width: width,
        padding: kPadding10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (boxshadow)
              BoxShadow(
                  blurRadius: 4,
                  // offset: Offset(20, 10),
                  blurStyle: BlurStyle.outer)
          ],
        ),
        child: child,
      ),
    );
  }
}

class ContainerWithBorder extends StatelessWidget {
  Widget child;
  Function()? ontap;
  ContainerWithBorder({this.ontap, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.maxFinite,
        padding: kPadding10,
        decoration: BoxDecoration(
            color: kColorz.DrawerBlueGrey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: kColorz.DrawerBlueGrey)),
        child: child,
      ),
    );
  }
}

class ContainerWithColumn extends StatelessWidget {
  List<Widget> children;
  String title;
  ContainerWithColumn({required this.title, this.children = const [], Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title :'),
            Container(
              padding: kPadding10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
