import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/schedule.dart';
import 'package:f_on/models/student.dart';
import 'package:flutter/foundation.dart';

class StudentSchedule {
  final String id;
  Status status;
  Student student;
  Schedule schedule;
  Classroom classroom;

  StudentSchedule({@required this.id, this.status});

  factory StudentSchedule.fromJSON(Map<String, dynamic> json) {
    var studentSchedule =
        new StudentSchedule(id: json['id'], status: json['status']);

    if (json.keys.contains('status')) {
      studentSchedule.status = Status.fromJSON(json['status']);
    }

    if (json.keys.contains('student')) {
      studentSchedule.student = Student.fromJSON(json['student']);
    }

    if (json.keys.contains('schedule')) {
      studentSchedule.schedule = Schedule.fromJSON(json['schedule']);
    }

    if (json.keys.contains('classroom')) {
      studentSchedule.classroom = Classroom.fromJSON(json['classroom']);
    }
    return studentSchedule;
  }
}

class Status {
  final String id;
  int round;
  int online;
  int homework;

  Status({@required this.id, this.round, this.online, this.homework});

  factory Status.fromJSON(Map<String, dynamic> json) {
    return new Status(
        id: json['id'],
        round: json['round'],
        online: json['online'],
        homework: json['homework']);
  }
}
