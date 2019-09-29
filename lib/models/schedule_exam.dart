import 'package:f_on/models/exam.dart';
import 'package:f_on/models/schedule.dart';
import 'package:flutter/widgets.dart';

class ScheduleExam {
  final String id;
  Schedule schedule;
  ExamRecord examRecord;
  int submitNum;

  ScheduleExam({@required this.id, this.submitNum});

  factory ScheduleExam.fromJSON(Map<String, dynamic> json) {
    var scheduleExam =
        new ScheduleExam(id: json['_id'], submitNum: json['submit_num']);

    if (json.keys.contains('exam_record')) {
      scheduleExam.examRecord = ExamRecord.fromJSON(json['exam_record']);
    }

    return scheduleExam;
  }
}

class ExamRecord {
  final String id;
  Exam exam;
  int rightCount;

  ExamRecord({@required this.id, this.rightCount});

  factory ExamRecord.fromJSON(Map<String, dynamic> json) {
    return new ExamRecord(id: json['_id'], rightCount: json['right_count']);
  }
}
