import 'package:f_on/models/course.dart';
import 'package:f_on/models/file.dart';
import 'package:flutter/foundation.dart';

class CourseGroup {
  final String id;
  String name;
  Image image;
  List<Course> courses = [];

  CourseGroup({@required this.id, this.name, this.image});

  factory CourseGroup.fromJSON(Map<String, dynamic> json) {
    var courseGroup = new CourseGroup(id: json['_id'], name: json['name']);

    if (json.keys.contains('image')) {
      courseGroup.image = Image.fromJSON(json['image']);
    }

    if (json['courses'] is List) {
      (json['courses'] as List).forEach((_json) {
        courseGroup.courses.add(Course.fromJSON(_json));
      });
    }

    return courseGroup;
  }
}
