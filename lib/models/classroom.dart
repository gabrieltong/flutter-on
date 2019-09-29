import 'package:f_on/models/course.dart';
import 'package:f_on/models/course_version.dart';
import 'package:f_on/models/schedule.dart';
import 'package:f_on/models/student.dart';
import 'package:flutter/foundation.dart';

class Classroom {
  final String id;
  String name;
  int category;
  DateTime startTime;
  DateTime endTime;
  String message;
  int status;
  int progress;
  CourseVersion courseVersion;
  Course course;
  List<Schedule> schedules = [];
  List<Student> students = [];
  Teacher teacher;

  Classroom(
      {@required this.id,
      this.name,
      this.status,
      this.category,
      this.startTime,
      this.endTime,
      this.message,
      this.progress});

  factory Classroom.fromJSON(Map<String, dynamic> json) {
    var classroom = Classroom(
        id: json['_id'],
        name: json['name'],
        status: json['status'],
        category: json['category'],
        progress: json['progress'],
        startTime: json['start_time'] == null
            ? null
            : DateTime.parse(json['start_time']),
        endTime:
            json['end_time'] == null ? null : DateTime.parse(json['end_time']));

    if (json['students'] is List) {
      (json['students'] as List).forEach((studentJson) {
        classroom.students.add(Student.fromJSON(studentJson));
      });
    }

    if (json['schedules'] is List) {
      (json['schedules'] as List).forEach((scheduleJson) {
        var schedule = Schedule.fromJSON(scheduleJson);
        classroom.schedules.add(schedule);
      });
    }

    if (json.keys.contains('course_version')) {
      classroom.courseVersion = CourseVersion.fromJSON(json['course_version']);
    }

    if (json.keys.contains('course')) {
      classroom.course = Course.fromJSON(json['course']);
    }
    return classroom;
  }
}
