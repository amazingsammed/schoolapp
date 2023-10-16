

class MentorX{
  String profileurl;
  String fullname;
  String topic;
  String about;
  String topicdescription;

//<editor-fold desc="Data Methods">
  MentorX({
    required this.profileurl,
    required this.fullname,
    required this.topic,
    required this.about,
    required this.topicdescription,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MentorX &&
          runtimeType == other.runtimeType &&
          profileurl == other.profileurl &&
          fullname == other.fullname &&
          topic == other.topic &&
          about == other.about &&
          topicdescription == other.topicdescription);

  @override
  int get hashCode =>
      profileurl.hashCode ^
      fullname.hashCode ^
      topic.hashCode ^
      about.hashCode ^
      topicdescription.hashCode;

  @override
  String toString() {
    return 'MentorX{' +
        ' profileurl: $profileurl,' +
        ' fullname: $fullname,' +
        ' topic: $topic,' +
        ' about: $about,' +
        ' topicdescription: $topicdescription,' +
        '}';
  }

  MentorX copyWith({
    String? profileurl,
    String? fullname,
    String? topic,
    String? about,
    String? topicdescription,
  }) {
    return MentorX(
      profileurl: profileurl ?? this.profileurl,
      fullname: fullname ?? this.fullname,
      topic: topic ?? this.topic,
      about: about ?? this.about,
      topicdescription: topicdescription ?? this.topicdescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profileurl': this.profileurl,
      'fullname': this.fullname,
      'topic': this.topic,
      'about': this.about,
      'topicdescription': this.topicdescription,
    };
  }

  factory MentorX.fromMap(Map<String, dynamic> map) {
    return MentorX(
      profileurl: map['profileurl'] as String,
      fullname: map['fullname'] as String,
      topic: map['topic'] as String,
      about: map['about'] as String,
      topicdescription: map['topicdescription'] as String,
    );
  }

//</editor-fold>
}