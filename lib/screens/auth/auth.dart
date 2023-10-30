

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/appcontroller.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/screens/auth/signup.dart';

import '../home.dart';
import '../master.dart';
import 'login.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
return FutureBuilder(
    future: myappController.getCurrentUser(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        return Master();
      } else if (snapshot.hasError) {
        return Icon(Icons.error_outline);
      } else {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    });
            return Master();
          } else {
            return Obx((){
              if(myappController.islogin.value) return Login();
              return Signup();
            });

          }
        });
  }
}
