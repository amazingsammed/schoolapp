class TimeTable {
  String subjectname;
  String time;
  String day;
  String classs;

  TimeTable({
    required this.subjectname,
    required this.time,
    required this.day,
    required this.classs,
  });
}

List<TimeTable> timetable = [
  TimeTable(
      subjectname: 'Accounting',
      time: '7:00 AM',
      classs: 'Btl 200',
      day: 'monday'),
  TimeTable(
      subjectname: 'Business Law',
      time: '11:45 AM',
      classs: 'bhl 300',
      day: 'monday'),
  TimeTable(
      subjectname: 'Com. Skills',
      time: '12:00 AM',
      classs: 'jhl 100',
      day: 'monday'),
  TimeTable(
      subjectname: 'Economics',
      time: '9:30 AM',
      classs: 'bsl 200',
      day: 'tuesday'),
  TimeTable(
      subjectname: 'French',
      time: '8:30 AM',
      classs: 'bfl 400',
      day: 'tuesday'),
  TimeTable(
      subjectname: 'Procument',
      time: '6:00 PM',
      classs: 'bfl 100',
      day: 'tuesday'),
  TimeTable(
      subjectname: 'Marketing',
      time: '10:00 AM',
      classs: 'btl 300',
      day: 'wednesday'),
  TimeTable(
      subjectname: 'Business Communication',
      time: '11:45 AM',
      classs: 'bhl 200',
      day: 'wednesday'),
  TimeTable(
      subjectname: 'Business Law',
      time: '11:45 AM',
      classs: 'bhl 300',
      day: 'thursday'),
  TimeTable(
      subjectname: 'Com. Skills',
      time: '12:00 AM',
      classs: 'jhl 100',
      day: 'thursday'),
  TimeTable(
      subjectname: 'Economics',
      time: '9:30 AM',
      classs: 'bsl 200',
      day: 'friday'),
  TimeTable(
      subjectname: 'French', time: '8:30 AM', classs: 'bfl 400', day: 'friday'),
  TimeTable(
      subjectname: 'Procument',
      time: '6:00 PM',
      classs: 'bfl 100',
      day: 'friday'),
];
