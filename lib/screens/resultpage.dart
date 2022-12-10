import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolapp/screens/resultdetails.dart';
import 'package:schoolapp/widgets/colors.dart';
import 'package:schoolapp/widgets/constants.dart';
import 'package:schoolapp/widgets/kcontainers.dart';
import 'package:schoolapp/widgets/responsive.dart';

import '../models/semester_model.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Container(
        margin: kPadding20,
        child: Responsive(
          mobile: ListView.separated(
            itemCount: semester.length,
            itemBuilder: (BuildContext context, int index) {
              Semester item = semester[index];
              return ContainerWithBorder(
                  ontap: () {
                    Get.to(() => ResultDetails(
                        semester_num: item.name, year: item.year));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: kColorz.DrawerBlueGrey,
                              child: Text('${index + 1}'),
                            ),
                            title: Text('Semester ${item.name}'),
                            subtitle: Text('level: ${item.level}'),
                          ),
                        ),
                      ),
                      Text('${item.year}')
                    ],
                  ));
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10,
            ),
          ),
          desktop: GridView.builder(
            itemCount: semester.length,
            itemBuilder: (BuildContext context, int index) {
              Semester item = semester[index];
              return Container(
                height: 70,
                child: ContainerWithBorder(
                    ontap: () {
                      Get.to(() => ResultDetails(
                          semester_num: item.name, year: item.year));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: kColorz.DrawerBlueGrey,
                                child: Text('${index + 1}'),
                              ),
                              title: Text('Semester ${item.name}'),
                              subtitle: Text('level: ${item.level}'),
                            ),
                          ),
                        ),
                        Text('${item.year}')
                      ],
                    )),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 90),
          ),
        ),
      ),
    );
  }
}
