import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/models/articlepost.dart';
import 'package:schoolapp/widgets/constants.dart';

class PostPreview extends StatelessWidget {
  ArticlePost item;
  PostPreview({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){},
              icon:Icon( Icons.more_vert))
        ],
      ),
        body: Column(
          children: [
            kSizedbox20,
            Expanded(
              child: StreamBuilder(
                  stream: PostBody
                      .doc(item.userid)
                      .collection('body').where('id',isEqualTo: item.id)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      QuerySnapshot<Map<String, dynamic>> body = snapshot.data;
                      var bodydata = body.docs[0].data()['body'];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: NetworkImage(item.imageurl))),
                          ),
                          kSizedbox20,
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(

                                children: [
                                  Text(item.title,style: TextStyle(
                                    fontSize: 20
                                  ),),
                                  Divider(),
                                  Expanded(child: Text(bodydata)),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return Center(child: const CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ));
  }
}
