import 'dart:core';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeTable {
  String title;
  TimeOfDay time;
  bool isActive;
int get day => days();
  String dayintext;
  String? classs;

  TimeTable({
    this.isActive = true,
    required this.title,
    required this.time,
    required this.dayintext,
     this.classs,
  });

  int days(){
    switch (dayintext) {
      case 'Monday':
        return 1;
      case 'Tuesday':
        return 2;
      case 'Wednesday':
        return 3;
      case 'Thursday':
        return 4;
      case 'Friday':
        return 5;
      case 'Saturday':
        return 6;
      case 'Sunday':
        return 7;
        default:
          return 1;
    }

  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'time': '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
      'isActive': this.isActive,
      'dayintext': this.dayintext,
      'classs': this.classs,
    };
  }

  factory TimeTable.fromMap(Map<String, dynamic> map) {
    String s =map['time'] as String;
    var thetime =TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));
    return TimeTable(
      title: map['title'] as String,
      time: thetime as TimeOfDay,
      isActive: map['isActive'] as bool,
      dayintext: map['dayintext'] as String,
      classs: map['classs']??"" as String,
    );
  }
}



