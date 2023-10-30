


import 'dart:convert';

import 'package:schoolapp/models/timetable_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appcontroller.dart';

extension MyStorage on AppController{

  Future<void> updateListInSharedPreferences() async {
    List<Map<String,dynamic>> mydata =[];
    for (var element in myTimeList.value) {
      mydata.add(element.toMap());
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mylis', json.encode(mydata));
  }

  Future<void> getSharedPreferences() async {
    myTimeList.clear();
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('mylis');
    if(data ==null) return;
    List mydata = json.decode(data);
    for (var element in mydata) {
      myTimeList.value.add(TimeTable.fromMap(element));
    }
  }

   void updateMyTimeTableText()  {
     print('object');
    final now = DateTime.now();
    for(TimeTable item in myTimeList){
      if(now.isAtSameMomentAs(DateTime(now.year,now.month,item.day,item.time.hour,item.time.minute))){
        myCurrentSubject.value[0] = item;
      }
    }
    print('object');
  }

}