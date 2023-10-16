import 'package:flutter/material.dart';

import '../widgets/textbutton.dart';
import '../widgets/textform.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController firstname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController lastname = TextEditingController();
    TextEditingController year = TextEditingController();
    TextEditingController course = TextEditingController();
    TextEditingController gender = TextEditingController();
    TextEditingController phone = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            height: 720,
            width: 800,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registration Form",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    TextwithForm(
                      data: "First Name",
                      controller: firstname,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    TextwithForm(
                      data: "Last Name",
                      controller: lastname,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    TextwithForm(
                      data: "Year of Birth",
                      controller: year,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    TextwithForm(
                      data: "Gender",
                      hinttext: 'Male or Female',
                      controller: gender,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    TextwithForm(
                      data: "Email",
                      controller: email,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    TextwithForm(
                      data: "Phone Number",
                      controller: phone,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                TextwithForm(
                  data: "Course",
                  controller: course,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                  width: 80,
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      if (checkText(firstname.text, 'firstname')) {
                        if (checkText(lastname.text, 'lastname')) {
                          if (checkText(gender.text, 'gender')) {
                            if (checkText(course.text, 'course')) {
                              if (checkText(phone.text, 'phone')) {
                                if (checkText(email.text, 'email')) {
                                  if (checkText(year.text, 'year')) {}
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    child: Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool checkText(String data, String name) {
    String element = data.trim();
    if (element.isEmpty) {
      if (name.contains('em') == true) {
        if (element.contains('@')) {
          return true;
        } else {
          print('email is incorrect');
          return false;
        }
      }
      print('$name cannot be empty');
      return false;
    }
    return true;
  }
}
