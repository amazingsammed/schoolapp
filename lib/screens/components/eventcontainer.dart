import 'package:flutter/material.dart';
import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/constants.dart';

class EventContainer extends StatelessWidget {
  String image;
  String userimage;
  String time;
  String title;
  String avenue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 250,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                // offset: Offset(20, 10),
                blurStyle: BlurStyle.outer)
          ]),
      child: Container(
        margin: kPadding10.copyWith(bottom: 5),
        // alignment: Alignment.center,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: kColorz.DrawerBlueGrey)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(userimage),
          ),
          title: Text(
            title,
            style: TextStyle(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(avenue),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text(time)],
          ),
        ),
      ),
    );
  }

  EventContainer({
    Key? key,
    required this.image,
    required this.userimage,
    required this.time,
    required this.title,
    required this.avenue,
  }) : super(key: key);
}
