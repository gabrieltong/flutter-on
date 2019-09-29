import 'package:f_on/models/schedule.dart';
import 'package:f_on/models/schedule_exam.dart';
import 'package:f_on/models/student.dart';
import 'package:flutter/foundation.dart';

class StudentExam {
  final String id;
  int seIndex;
  int rightExam;
  int examLength;

  Student student;
  Schedule schedule;
  ExamRecord examRecord;

  StudentExam(
      {@required this.id, this.seIndex, this.rightExam, this.examLength});

  factory StudentExam.fromJSON(Map<String, dynamic> json) {
    var studentExam = new StudentExam(
        id: json['_id'],
        seIndex: json['se_index'],
        rightExam: json['right_exam'],
        examLength: json['exam_length']);

    if (json.keys.contains('student')) {
      studentExam.student = Student.fromJSON(json['student']);
    }

    if (json.keys.contains('schedule')) {
      studentExam.schedule = Schedule.fromJSON(json['schedule']);
    }

    if (json.keys.contains('exam_record')) {
      studentExam.examRecord = ExamRecord.fromJSON(json['exam_record']);
    }

    return studentExam;
  }
}
