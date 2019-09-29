import 'package:f_on/models/course.dart';
import 'package:f_on/models/lesson.dart';
import 'package:flutter/foundation.dart';

class CourseVersion {
  final String id;
  Course course;
  String name;
  List<Lesson> lessons;

  CourseVersion({@required this.id, this.name, this.course});

  factory CourseVersion.fromJSON(Map<String, dynamic> json) {
    var courseVersion = CourseVersion(id: json['_id']);
    if (json.keys.contains('course')) {
      courseVersion.course = Course.fromJSON(json['course']);
    }

    if (json['lessons'] is List) {
      (json['lessons'] as List).forEach((_json) {
        courseVersion.lessons.add(Lesson.fromJSON(_json));
      });
    }

    return courseVersion;
  }
}
