import 'package:flutter/material.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../widgets/textform.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double Kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: 800,
          width: 1200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                    child: Container(
                  color: Colors.redAccent,
                )),
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome to your student portal",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        TextwithForm(
                          data: "",
                          hinttext: 'Index Number',
                        ),
                        TextwithForm(
                          data: "",
                          hinttext: 'Password',
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {},
                            child: Text(
                              "Login".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
