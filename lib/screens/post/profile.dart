import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/models/articlepost.dart';
import 'package:schoolapp/screens/post/createpost.dart';
import 'package:schoolapp/screens/post/postpreview.dart';
import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/constants.dart';
import 'package:schoolapp/widgets/ktexts.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../../models/user_model.dart';
import '../../widgets/kcontainers.dart';
import '../components/profilec.dart';
import 'editprofile.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
       backgroundColor: Colors.transparent,
        actions:  [
          Icon(Icons.settings,color: Colors.black,),kSizedbox10
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                  stream: myappController.getUserStream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      DocumentSnapshot<Map<String, dynamic>> item = snapshot.data;
                      UserX user = UserX.fromMap(item.data()as Map<String, dynamic>);
                      myappController.currentUserList.value = [user];
                      return Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 50,backgroundImage: appImage(user.image),backgroundColor: Colors.transparent,),
                              kSizedbox20,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user.name.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),maxLines: 1,),
                                  kSizedbox5,
                                  Text('@University',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),maxLines: 1,),
                                  kSizedbox5,
                                  Text("Accounting",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),maxLines: 1,),
                                ],
                              )
                            ],
                          ),
                          kSizedbox20,
                          kSizedbox10,
                          Row(children: [
                            //  NumAndText(num: myappController.mypostCount.value.toString(), text: 'Posts',),
                            NumAndText(num: user.followers!.length.toString(), text: 'Followers',),
                            NumAndText(num: user.following!.length.toString(), text: 'Following',)
                          ],),
                          kSizedbox20,
                          kSizedbox10,
                          Row(
                            children: [
                              ProfileButton(ontap:(){
                                Get.to(()=>EditProfilePage(user: user,));
                              },filled: true, text: 'Edit Profile',),
                              kSizedbox20,
                              ProfileButton(filled: false, text: 'About',)
                            ],
                          ),
                          Divider(),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              // Column(
              //   children: [
              //     Row(
              //       children: [
              //         CircleAvatar(radius: 50,backgroundImage: appImage(user.image),backgroundColor: Colors.transparent,),
              //         kSizedbox20,
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(user.name.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),maxLines: 1,),
              //             kSizedbox5,
              //             Text('@University',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple),maxLines: 1,),
              //             kSizedbox5,
              //             Text("Accounting",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),maxLines: 1,),
              //           ],
              //         )
              //       ],
              //     ),
              //     kSizedbox20,
              //     kSizedbox10,
              //     Row(children: [
              //       //  NumAndText(num: myappController.mypostCount.value.toString(), text: 'Posts',),
              //       NumAndText(num: user.followers!.length.toString(), text: 'Followers',),
              //       NumAndText(num: user.following!.length.toString(), text: 'Following',)
              //     ],),
              //     kSizedbox20,
              //     kSizedbox10,
              //     Row(
              //       children: [
              //         ProfileButton(filled: true, text: 'Edit Profile',),
              //         kSizedbox20,
              //         ProfileButton(filled: false, text: 'About',)
              //       ],
              //     ),
              //     Divider(),
              //   ],
              // ),
             StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('Post').where('userid' ,isEqualTo: myappController.currentUser.userid).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          QuerySnapshot<Map<String, dynamic>> item = snapshot.data;
                          myappController.mypostCount.value = item.docs.length;
                          return ListView.builder(itemCount: item.docs.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                            ArticlePost itemx = ArticlePost.fromMap(item.docs[index].data());
                              return InkWell(

                                  onTap: (){
                                    Get.to(()=>PostPreview(item: itemx,));
                                  },
                                  child: PostItem(item: itemx));
                            },);
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return CircularProgressIndicator();
                        }
                      })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),
        tooltip: 'Add', onPressed: () {
          Get.to(()=>CreatePost(),fullscreenDialog: true);
      },
      ),
    );
  }
}


class PostItem extends StatelessWidget {
  ArticlePost item;
   PostItem({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(item.title,style: TextStyle(
                      fontSize: 20
                  ),),
                  Text('Publised on ${myDateTime(item.date)}',style: TextStyle(
                  ),),
                ],
              )),
              SizedBox(width: 6,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(item.imageurl),
                    fit: BoxFit.cover
                  )
                ),
                height: 60,
                width: 100,

              )
            ],
          )
        ],
      ),
    );
  }
}

