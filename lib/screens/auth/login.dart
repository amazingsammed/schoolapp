

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/models/user_model.dart';

import '../../controllers/appcontroller.dart';
import '../../widgets/constants.dart';

class Login extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSizedbox30,
                kSizedbox30,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Login',
                    style: kLoginTitleStyle(size),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Welcome Back ',
                    style: kLoginSubtitleStyle(size),
                  ),
                ),


                kSizedbox20,
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  controller: emailController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (value.length < 4) {
                      return 'at least enter 4 characters';
                    } else if (value.length > 20) {
                      return 'maximum character is 20';
                    }
                    return null;
                  },
                ),
                kSizedbox20,
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_open),
                    hintText: 'Password',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  obscureText: true,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 7) {
                      return 'at least enter 6 characters';
                    } else if (value.length > 20) {
                      return 'maximum character is 20';
                    }
                    return null;
                  },
                ),

                kSizedbox30,
                loginButton(),
                kSizedbox30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Does not have an account'),
                    TextButton(onPressed: (){
                      myappController.islogin.value=false;
                      myappController.islogin.refresh();
                    }, child: Text('Sign Up')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: ()async {

          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            await myappController.login(UserX(email: emailController.text.trim(), password: passwordController.text.trim(), name: '', image: '', userid: ''));
            // ... Navigate To your Home Page
          }
        },
        child: Text('Login'),
      ),
    );
  }
}
