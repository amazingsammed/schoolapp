import 'dart:math';

class Results {
  String course_code;
  String subject;
  int semester;
  String year;
  int class_score;
  int exams_score;
  int get total_score => class_score.round() + exams_score.round();
  double get grade =>
      ((total_score * credit_hours) / (100 * credit_hours)) * 10;
  int credit_hours;

  Results(
      {this.course_code = 'BTECH',
      required this.subject,
      required this.class_score,
      required this.exams_score,
      required this.credit_hours,
      this.semester = 1,
      this.year = '2021'});
}

List<Results> results = [
  Results(
      subject: 'Accounting',
      class_score: Random().nextInt(40),
      exams_score: Random().nextInt(60),
      credit_hours: Random().nextInt(2) + 1),
  Results(
      subject: 'Business law',
      class_score: Random().nextInt(40),
      exams_score: Random().nextInt(60),
      credit_hours: Random().nextInt(2) + 1),
  Results(
      subject: 'Com. Skills',
      class_score: Random().nextInt(40),
      exams_score: Random().nextInt(60),
      credit_hours: Random().nextInt(2) + 1),
  Results(
      subject: 'Business Communication',
      class_score: Random().nextInt(40),
      exams_score: Random().nextInt(60),
      credit_hours: Random().nextInt(2) + 1),
  Results(
      subject: 'Marketing',
      class_score: Random().nextInt(40),
      exams_score: Random().nextInt(60),
      credit_hours: Random().nextInt(2) + 1),
  Results(
      subject: 'Economics',
      class_score: Random().nextInt(40),
      exams_score: Random().nextInt(60),
      credit_hours: Random().nextInt(2) + 1),
  Results(
      subject: 'Procurement',
      class_score: Random().nextInt(40),
      exams_score: Random().nextInt(60),
      credit_hours: Random().nextInt(2) + 1),
];

class TotalResult {
  String totalsubject = 'Total';
  int get totalexams_score => totalexamsscores();
  int get totalclass_score => totalclassscores();
  int get totalscore => totalscores();
  double get totalgrade => totalgradep();
  int get totalcredit_hours => totalcredith();

  int totalexamsscores() {
    int element1 = 0;
    for (var element in results) {
      element1 += element.exams_score;
    }
    ;
    return element1;
  }

  int totalclassscores() {
    int element1 = 0;
    for (var element in results) {
      element1 += element.class_score;
    }
    ;
    return element1;
  }

  int totalscores() {
    int element1 = 0;
    for (var element in results) {
      element1 += element.total_score;
    }
    ;
    return element1;
  }

  double totalgradep() {
    double element1 = 0;
    for (var element in results) {
      element1 += element.grade;
    }
    ;

    return element1 / results.length;
  }

  int totalcredith() {
    int element1 = 0;
    for (var element in results) {
      element1 += element.credit_hours;
    }
    ;

    return element1;
  }
}
