import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolapp/controllers/appcontroller.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({Key? key}) : super(key: key);

  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  late FixedExtentScrollController _controller;
  int selectedmin =0;
  int selectedhour=0;
  int selectedam=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // hours wheel
        Container(
          height: 200,
          width: 70,
          child: ListWheelScrollView.useDelegate(
            controller: _controller,
            itemExtent: 50,
            perspective: 0.005,
            diameterRatio: 1.2,
            onSelectedItemChanged: (val){
              setState(() {
                selectedhour=val;
                myappController.hour.value=selectedhour;
              });
            },
            physics: FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 13,
              builder: (context, index) {
                return MyHours(
                  hours: index, selected: selectedhour,
                );
              },
            ),
          ),
        ),

        SizedBox(
          width: 10,
        ),

        // minutes wheel
        Container(
          height: 200,
          width: 70,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 50,
            perspective: 0.005,
            onSelectedItemChanged: (value){
              setState(() {
                selectedmin = value;
                myappController.min.value=selectedmin;
              });
            },
            diameterRatio: 1.2,
            physics: FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 60,
              builder: (context, index) {
                return MyMinutes(
                  mins: index,selected: selectedmin,
                );
              },
            ),
          ),
        ),

        SizedBox(
          width: 15,
        ),

        // am or pm
        Container(
          height: 200,
          width: 70,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 50,
            perspective: 0.005,
            diameterRatio: 1.2,
            onSelectedItemChanged: (val){
              setState(() {
                selectedam =val;
                myappController.isam.value=selectedam;
              });

            },
            physics: FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 2,
              builder: (context, index) {
                return AmPm(
                    selected: selectedam,
                    index:index
                );

              },
            ),
          ),
        ),
      ],
    );
  }
}

class MyHours extends StatelessWidget {
  int hours;
  int selected;

  MyHours({required this.hours,required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            hours.toString(),
            style: TextStyle(
              fontSize: 40,
              color: hours==selected ?Colors.black:Colors.black12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
class AmPm extends StatelessWidget {

  final int index ;
  final int selected;
  AmPm({required this.index,required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            index == 0 ? 'am' : 'pm',
            style: TextStyle(
              fontSize: 40,
              color: index==selected ?Colors.black:Colors.black12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
class MyMinutes extends StatelessWidget {
  int mins;
  int selected;

  MyMinutes({required this.mins,required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            mins < 10 ? '0' + mins.toString() : mins.toString(),
            style: TextStyle(
              fontSize: 40,
              color: mins==selected ?Colors.black:Colors.black12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}