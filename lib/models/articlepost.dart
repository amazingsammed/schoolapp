


import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlePost{
  String userid;
  String title;
  DateTime date;
  String imageurl;
  int id;

//<editor-fold desc="Data Methods">


  ArticlePost({
    required this.userid,
    required this.title,
    required this.date,
    required this.imageurl,
    required this.id,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ArticlePost &&
              runtimeType == other.runtimeType &&
              userid == other.userid &&
              title == other.title &&
              date == other.date &&
              imageurl == other.imageurl &&
              id == other.id
          );


  @override
  int get hashCode =>
      userid.hashCode ^
      title.hashCode ^
      date.hashCode ^
      imageurl.hashCode ^
      id.hashCode;


  @override
  String toString() {
    return 'ArticlePost{' +
        ' userid: $userid,' +
        ' title: $title,' +
        ' date: $date,' +
        ' imageurl: $imageurl,' +
        ' id: $id,' +
        '}';
  }


  ArticlePost copyWith({
    String? userid,
    String? title,
    DateTime? date,
    String? imageurl,
    int? id,
  }) {
    return ArticlePost(
      userid: userid ?? this.userid,
      title: title ?? this.title,
      date: date ?? this.date,
      imageurl: imageurl ?? this.imageurl,
      id: id ?? this.id,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'userid': this.userid,
      'title': this.title,
      'date': this.date,
      'imageurl': this.imageurl,
      'id': this.id,
    };
  }

  factory ArticlePost.fromMap(Map<String, dynamic> map) {
    return ArticlePost(
      userid: map['userid'] as String,
      title: map['title'] as String,
      date:( map['date'] as Timestamp).toDate(),
      imageurl: map['imageurl'] as String,
      id: map['id'] as int,
    );
  }


//</editor-fold>
}
