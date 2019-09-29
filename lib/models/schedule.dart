import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/file.dart';
import 'package:f_on/models/lesson.dart';

class Schedule {
  Lesson lesson;
  Classroom classroom;
  DateTime startTime;
  int status;
  int statusHomework;
  Video recordVideo;
}
