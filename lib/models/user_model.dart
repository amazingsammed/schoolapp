// class User {
//   String? firstname;
//   String? age;
//   String? course;
//   String? surname;
//   bool ismale;
//   String? phone;
//   String? course_code;
//   String? level;
//   String? classs;
//   String? image;
//   String? guardian_name;
//   String? guardian_occupation;
//   String? guardian_location;
//   String? guardian_phone;
//
//   User({
//     this.firstname,
//     this.age,
//     this.course,
//     this.surname,
//     required this.ismale,
//     this.phone,
//     this.image,
//     this.course_code,
//     this.level,
//     this.classs,
//     this.guardian_name,
//     this.guardian_occupation,
//     this.guardian_location,
//     this.guardian_phone,
//   });
// }
//
// User student = User(
//   firstname: 'Sammed',
//   image: 'assets/images/sammed.jpg',
//   age: "20",
//   course: 'Accounting',
//   surname: 'Alhassan',
//   ismale: true,
//   phone: '0543220177',
//   course_code: 'Btech',
//   level: '200',
//   classs: '1c',
//   guardian_name: 'Alhassan Basit',
//   guardian_occupation: "Doctor",
//   guardian_location: 'Kumasi',
//   guardian_phone: '0244040404',
// );


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schoolapp/models/timetable_model.dart';

class UserX {
  String email;
  String name;
  String? password;
  String image;
  String userid;
  List? followers;
  List? following;

//<editor-fold desc="Data Methods">
  UserX({
    required this.email,
    required this.name,
    this.password,
    required this.image,
    required this.userid,
    this.followers,
    this.following,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserX &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          name == other.name &&
          password == other.password &&
          image == other.image &&
          userid == other.userid &&
          followers == other.followers &&
          following == other.following);

  @override
  int get hashCode =>
      email.hashCode ^
      name.hashCode ^
      password.hashCode ^
      image.hashCode ^
      userid.hashCode ^
      followers.hashCode ^
      following.hashCode;

  @override
  String toString() {
    return 'UserX{' +
        ' email: $email,' +
        ' name: $name,' +
        ' password: $password,' +
        ' image: $image,' +
        ' userid: $userid,' +
        ' followers: $followers,' +
        ' following: $following,' +
        '}';
  }

  UserX copyWith({
    String? email,
    String? name,
    String? password,
    String? image,
    String? userid,
    List? followers,
    List? following,
  }) {
    return UserX(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      image: image ?? this.image,
      userid: userid ?? this.userid,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'name': this.name,
      'image': this.image,
      'userid': this.userid,
      'followers': this.followers,
      'following': this.following,
    };
  }

  factory UserX.fromMap(Map<String, dynamic> map) {
    return UserX(
      email: map['email'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      userid: map['userid'] as String,
      followers: (map['followers']??[]) as List,
      following: (map['following']??[]) as List,
    );
  }

//</editor-fold>
}

class ChatRoomitemtype{
  String recentmessage;
  DateTime time;
  bool isgroup;
  List participant;
  String? groupname;
  String? groupimage;
  String? groupid;

//<editor-fold desc="Data Methods">
  ChatRoomitemtype({
    required this.recentmessage,
    required this.time,
    required this.isgroup,
    required this.participant,
    this.groupname,
    this.groupimage,
    this.groupid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatRoomitemtype &&
          runtimeType == other.runtimeType &&
          recentmessage == other.recentmessage &&
          time == other.time &&
          isgroup == other.isgroup &&
          participant == other.participant &&
          groupname == other.groupname &&
          groupimage == other.groupimage &&
          groupid == other.groupid);

  @override
  int get hashCode =>
      recentmessage.hashCode ^
      time.hashCode ^
      isgroup.hashCode ^
      participant.hashCode ^
      groupname.hashCode ^
      groupimage.hashCode ^
      groupid.hashCode;

  @override
  String toString() {
    return 'ChatRoomitemtype{' +
        ' recentmessage: $recentmessage,' +
        ' time: $time,' +
        ' isgroup: $isgroup,' +
        ' participant: $participant,' +
        ' groupname: $groupname,' +
        ' groupimage: $groupimage,' +
        ' groupid: $groupid,' +
        '}';
  }

  ChatRoomitemtype copyWith({
    String? recentmessage,
    DateTime? time,
    bool? isgroup,
    List? participant,
    String? groupname,
    String? groupimage,
    String? groupid,
  }) {
    return ChatRoomitemtype(
      recentmessage: recentmessage ?? this.recentmessage,
      time: time ?? this.time,
      isgroup: isgroup ?? this.isgroup,
      participant: participant ?? this.participant,
      groupname: groupname ?? this.groupname,
      groupimage: groupimage ?? this.groupimage,
      groupid: groupid ?? this.groupid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recentmessage': this.recentmessage,
      'time': this.time,
      'isgroup': this.isgroup,
      'participant': this.participant,
      'groupname': this.groupname,
      'groupimage': this.groupimage,
      'groupid': this.groupid,
    };
  }

  factory ChatRoomitemtype.fromMap(Map<String, dynamic> map) {
    return ChatRoomitemtype(
      recentmessage: map['recentmessage'] as String,
      time: (map['time'] as Timestamp).toDate(),
      isgroup: map['isgroup'] as bool,
      participant: map['participant'] as List,
      groupname: map['groupname'] as String?,
      groupimage: map['groupimage'] as String?,
      groupid: map['groupid'] as String?,
    );
  }

//</editor-fold>
}

class ChatRoom{
  String imageurl;
  String name;
  String recentmessage;
  DateTime time;
  bool isgroup;
  String id;

//<editor-fold desc="Data Methods">
  ChatRoom({
    required this.imageurl,
    required this.name,
    required this.recentmessage,
    required this.time,
    required this.isgroup,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatRoom &&
          runtimeType == other.runtimeType &&
          imageurl == other.imageurl &&
          name == other.name &&
          recentmessage == other.recentmessage &&
          time == other.time &&
          isgroup == other.isgroup &&
          id == other.id);

  @override
  int get hashCode =>
      imageurl.hashCode ^
      name.hashCode ^
      recentmessage.hashCode ^
      time.hashCode ^
      isgroup.hashCode ^
      id.hashCode;

  @override
  String toString() {
    return 'ChatRoom{' +
        ' imageurl: $imageurl,' +
        ' name: $name,' +
        ' recentmessage: $recentmessage,' +
        ' time: $time,' +
        ' isgroup: $isgroup,' +
        ' id: $id,' +
        '}';
  }

  ChatRoom copyWith({
    String? imageurl,
    String? name,
    String? recentmessage,
    DateTime? time,
    bool? isgroup,
    String? id,
  }) {
    return ChatRoom(
      imageurl: imageurl ?? this.imageurl,
      name: name ?? this.name,
      recentmessage: recentmessage ?? this.recentmessage,
      time: time ?? this.time,
      isgroup: isgroup ?? this.isgroup,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageurl': this.imageurl,
      'name': this.name,
      'recentmessage': this.recentmessage,
      'time': this.time,
      'isgroup': this.isgroup,
      'id': this.id,
    };
  }

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      imageurl: map['imageurl'] as String,
      name: map['name'] as String,
      recentmessage: map['recentmessage'] as String,
      time: (map['time'] as Timestamp).toDate(),
      isgroup: map['isgroup'] as bool,
      id: map['id'] as String,
    );
  }

//</editor-fold>
}

