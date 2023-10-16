class Semester {
  String year;
  String name;
  String level;

  Semester({
    required this.year,
    required this.name,
    required this.level,
  });
}

List<Semester> semester = [
  Semester(year: '2021', name: '1', level: '100'),
  Semester(year: '2021', name: '2', level: '100'),
  Semester(year: '2022', name: '1', level: '200'),
  Semester(year: '2022', name: '2', level: '200'),
  Semester(year: '2023', name: '1', level: '300'),
  Semester(year: '2023', name: '2', level: '300'),
  Semester(year: '2024', name: '1', level: '400'),
  Semester(year: '2024', name: '2', level: '400'),
];
