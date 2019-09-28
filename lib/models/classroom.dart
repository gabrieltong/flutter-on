import 'package:f_on/models/course.dart';
import 'package:f_on/models/course_version.dart';
import 'package:f_on/models/schedule.dart';
import 'package:f_on/models/student.dart';
import 'package:f_on/models/teacher.dart';
import 'package:flutter/foundation.dart';

class Classroom {
  final String id;
  String name;
  int category;
  String startTime;
  String endTime;
  String message;
  int status;
  int progress;
  CourseVersion courseVersion;
  Course course;
  List<Schedule> schedules;
  List<Student> students;
  Teacher teacher;

  Classroom({@required this.id});
}
