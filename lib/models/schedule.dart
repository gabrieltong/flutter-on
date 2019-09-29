import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/file.dart';
import 'package:f_on/models/lesson.dart';
import 'package:flutter/foundation.dart';

class Schedule {
  final String id;
  DateTime startTime;
  int status;
  int statusHomework;

  Video recordVideo;
  Lesson lesson;
  Classroom classroom;

  Schedule(
      {@required this.id,
      this.status,
      this.lesson,
      this.classroom,
      this.startTime,
      this.statusHomework,
      this.recordVideo});

  factory Schedule.fromJSON(Map<String, dynamic> json) {
    var schedule = new Schedule(
        id: json['_id'],
        status: json['status'],
        statusHomework: json['status_homework']);

    if (json.keys.contains('record_video')) {
      schedule.recordVideo = Video.fromJSON(json['record_video']);
    }

    if (json.keys.contains('lesson')) {
      schedule.lesson = Lesson.fromJSON(json['lesson']);
    }

    if (json.keys.contains('classroom')) {
      schedule.classroom = Classroom.fromJSON(json['classroom']);
    }

    return schedule;
  }
}
