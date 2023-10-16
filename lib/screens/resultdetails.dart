import 'package:flutter/material.dart';
import 'package:schoolapp/models/results%20model.dart';
import 'package:schoolapp/widgets/constants.dart';

class ResultDetails extends StatelessWidget {
  String year;
  String semester_num;
  ResultDetails({Key? key, required this.year, required this.semester_num})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Results> newResults =
        results.where((element) => element.year == year).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester ${semester_num} - Year $year'),
      ),
      body: Container(
        margin: kPadding20,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
              defaultColumnWidth: FixedColumnWidth(100),
              border: TableBorder.all(),
              textBaseline: TextBaseline.ideographic,
              children: _buildTableRow(results)),
        ),
      ),
    );
  }
}

List<TableRow> _buildTableRow(List<Results> results) {
  List<TableRow> item = [];
  item.add(TableRow(children: [
    Text('Subject'),
    Text('Credit'),
    Text('C.A'),
    Text('Exam'),
    Text('Total'),
    Text('Grade'),
  ]));
  results.forEach((element) {
    item.add(
      TableRow(children: [
        Text(element.subject),
        Text(element.credit_hours.toString()),
        Text(element.class_score.toString()),
        Text(element.exams_score.toString()),
        Text(element.total_score.toString()),
        Text(element.grade.toStringAsPrecision(3)),
      ]),
    );
  });
  TotalResult results1 = TotalResult();
  item.add(
    TableRow(children: [
      Text(results1.totalsubject),
      Text(results1.totalcredit_hours.toString()),
      Text(results1.totalclass_score.toString()),
      Text(results1.totalexams_score.toString()),
      Text(results1.totalscore.toString()),
      Text(results1.totalgrade.toStringAsPrecision(3)),
    ]),
  );
  return item;
  //return TableRow();
}
