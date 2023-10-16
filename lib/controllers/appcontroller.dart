

import 'package:get/get.dart';
import 'package:schoolapp/controllers/sharedpref.dart';
import 'package:schoolapp/models/timetable_model.dart';


AppController myappController = AppController.instance;
class AppController extends GetxController{
  static AppController instance = Get.find();
  var hour = 0.obs;
  var min = 0.obs;
  var isam =0.obs;
  var myTimeList=<TimeTable>[].obs;
  addTime(TimeTable item){

    myTimeList.add(item);
    updateListInSharedPreferences();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSharedPreferences();
    super.onInit();
  }
}