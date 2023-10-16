import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolapp/screens/testedx.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../controllers/Scraping.dart';
import '../widgets/textform.dart';

class LoginPage extends StatelessWidget {
  Scraping provider = Get.put(Scraping());
   LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // double Kwidth = MediaQuery.of(context).size.width;
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
                            onPressed: () async {
                              String data = await provider.startUp();
                              Get.to(()=>Tested(data));
                            },
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
