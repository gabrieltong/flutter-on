import 'package:f_on/models/course_version.dart';
import 'package:f_on/models/online.dart';
import 'package:f_on/models/question_path.dart';
import 'package:f_on/models/round.dart';
import 'package:flutter/foundation.dart';

class Lesson {
  final String id;

  String intro;
  String contents;
  String points;

  CourseVersion courseVersion;
  List<Round> rounds;
  List<Series> serieses;
  Online online;

  Lesson({@required this.id, this.intro, this.contents, this.points});

  factory Lesson.fromJSON(Map<String, dynamic> json) {
    var lesson = new Lesson(
        id: json['_id'],
        intro: json['intro'],
        contents: json['contents'],
        points: json['points']);

    if (json['rounds'] is List) {
      (json['rounds'] as List).forEach((_json) {
        lesson.rounds.add(Round.fromJSON(_json));
      });
    }

    return lesson;
  }
}
