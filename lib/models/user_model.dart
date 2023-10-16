class User {
  String? firstname;
  String? age;
  String? course;
  String? surname;
  bool ismale;
  String? phone;
  String? course_code;
  String? level;
  String? classs;
  String? image;
  String? guardian_name;
  String? guardian_occupation;
  String? guardian_location;
  String? guardian_phone;

  User({
    this.firstname,
    this.age,
    this.course,
    this.surname,
    required this.ismale,
    this.phone,
    this.image,
    this.course_code,
    this.level,
    this.classs,
    this.guardian_name,
    this.guardian_occupation,
    this.guardian_location,
    this.guardian_phone,
  });
}

User student = User(
  firstname: 'Sammed',
  image: 'assets/images/sammed.jpg',
  age: "20",
  course: 'Accounting',
  surname: 'Alhassan',
  ismale: true,
  phone: '0543220177',
  course_code: 'Btech',
  level: '200',
  classs: '1c',
  guardian_name: 'Alhassan Basit',
  guardian_occupation: "Doctor",
  guardian_location: 'Kumasi',
  guardian_phone: '0244040404',
);
