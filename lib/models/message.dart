


import 'package:cloud_firestore/cloud_firestore.dart';

class Message_model{
  String content;
  String type;
  String? image;
  String createdby;
  DateTime date;

//<editor-fold desc="Data Methods">
  Message_model({
    required this.content,
    required this.type,
    this.image,
    required this.createdby,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message_model &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          type == other.type &&
          image == other.image &&
          createdby == other.createdby &&
          date == other.date);

  @override
  int get hashCode =>
      content.hashCode ^
      type.hashCode ^
      image.hashCode ^
      createdby.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'Message{' +
        ' content: $content,' +
        ' type: $type,' +
        ' image: $image,' +
        ' createdby: $createdby,' +
        ' date: $date,' +
        '}';
  }

  Message_model copyWith({
    String? content,
    String? type,
    String? image,
    String? createdby,
    DateTime? date,
  }) {
    return Message_model(
      content: content ?? this.content,
      type: type ?? this.type,
      image: image ?? this.image,
      createdby: createdby ?? this.createdby,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': this.content,
      'type': this.type,
      'image': this.image,
      'createdby': this.createdby,
      'date': Timestamp.fromDate(date),
    };
  }

  factory Message_model.fromMap(Map<String, dynamic> map) {
    return Message_model(
      content: map['content'] as String,
      type: map['type'] as String,
      image: map['image'] as String?,
      createdby: map['createdby'] as String,
      date: (map['date'] as Timestamp).toDate(),
    );
  }

//</editor-fold>
}