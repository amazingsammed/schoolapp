import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/controllers/localcontroller.dart';
import 'package:schoolapp/generated/assets.dart';
import 'package:schoolapp/widgets/constants.dart';

class CreatePost extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Create post'),),
      body: Column(
        children: [
          kSizedbox20,
          Row(
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: title,
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          hintText: 'Title',
                          //labelText: 'Title',
                          border: InputBorder.none),
                    )),
              ),

              Obx(() {
                return InkWell(
                  onTap: () async {
                    myappController.postimage.value =
                    await myappController.getImageAndSave(gallery: true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black,
                        image: DecorationImage(
                            image:  appImage(myappController.postimage.value),
                            fit: BoxFit.cover,
                          opacity: 0.6
                        )
                    ),
                    height: 60,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera,color: Colors.white,),
                        Text('select image',style: TextStyle(color: Colors.white),)
                      ],
                    ),

                  ),
                );
              }),
              SizedBox(width: 15,),
            ],
          ),
          kSizedbox10,
          Expanded(
            child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black12),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: body,
                  maxLines: null,
                  // Set this
                  expands: true,
                  // and this
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      hintText: 'Body',
                      border: InputBorder.none),
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () async{
          await myappController.uploadPost(title: title.text,body: body.text,imageurl: myappController.postimage.value);
          Get.back();
        },
      ),
    );
  }
}
