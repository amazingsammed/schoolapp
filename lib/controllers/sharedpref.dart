


import 'dart:convert';

import 'package:schoolapp/models/timetable_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appcontroller.dart';

extension MyStorage on AppController{

  Future<void> updateListInSharedPreferences() async {
    List<Map<String,dynamic>> mydata =[];
    myTimeList.value.forEach((element) {
      mydata.add(element.toMap());
    });
    final prefs = await SharedPreferences.getInstance();
    print(mydata.toString());
    await prefs.setString('mylis', json.encode(mydata));
  }

  Future<void> getSharedPreferences() async {
    myTimeList.clear();
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('mylis');
    if(data ==null) return;
    print(data);
    List mydata = json.decode(data);
    for (var element in mydata) {
      myTimeList.value.add(TimeTable.fromMap(element));
    }
  }

}