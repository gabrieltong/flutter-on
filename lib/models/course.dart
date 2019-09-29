import 'package:f_on/models/course_group.dart';
import 'package:f_on/models/course_version.dart';
import 'package:f_on/models/file.dart';
import 'package:flutter/foundation.dart';

class Course {
  String id;
  String name;
  String intro;

  Image image;
  CourseGroup courseGroup;
  List<CourseVersion> courseVersions;
  
  Course({@required this.name, @required this.id, this.image, this.intro});

  factory Course.fromJSON(Map<String, dynamic> json) {
    var course = new Course(id: json['_id'], name: json['name']);
    
    if (json.keys.contains('image')) {
      course.image = Image.fromJSON(json['image']);
    }

    if (json.keys.contains('course_group')) {
      course.courseGroup = CourseGroup.fromJSON(json['course_group']);
    }

    if (json['course_versions'] is List) {
      (json['course_versions'] as List).forEach((_json) {
        course.courseVersions.add(CourseVersion.fromJSON(_json));
      });
    }

    return course;
  }
}
