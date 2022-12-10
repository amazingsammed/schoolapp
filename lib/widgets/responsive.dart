import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  static const minimum_width = 700;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < minimum_width;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= minimum_width;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= minimum_width) {
      return desktop;
    } else {
      return mobile;
    }
  }
}
