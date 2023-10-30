import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:schoolapp/controllers/firebasecontroller.dart';
import 'package:schoolapp/models/user_model.dart';

import '../../controllers/appcontroller.dart';
import '../../widgets/constants.dart';

class Signup extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                    'SignUp',
                    style: kLoginTitleStyle(size),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Welcome Dear ',
                    style: kLoginSubtitleStyle(size),
                  ),
                ),
                kSizedbox20,
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Full Name',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    } else if (value.length < 2) {
                      return 'at least enter 2 characters';
                    } else if (value.length > 17) {
                      return 'maximum character is 17';
                    }
                    return null;
                  },
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
                    }
                    return null;
                  },
                ),
                kSizedbox20,
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: rpasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_open),
                    hintText: 'Retype-Password',
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
                    Text('Have account already'),
                    TextButton(
                        onPressed: () {
                          myappController.islogin.value = true;
                          myappController.islogin.refresh();
                        },
                        child: Text('Login')),
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
        onPressed: () async {
          if (rpasswordController.text.trim() !=
              passwordController.text.trim()) {
            Get.dialog(AlertDialog(
              title: const Text("Dear User"),
              content: const Text("Password Mismatch"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("CLOSE"))
              ],
            ));
            return;
          }

          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            await myappController.signUp(UserX(
              followers: [],
                following: [],
                email: emailController.text.trim(),
                name: nameController.text.trim(),
                password: passwordController.text.trim(),
                image: '',
                userid: ''));
            // ... Navigate To your Home Page
          }
        },
        child: const Text('SignUp'),
      ),
    );
  }
}
