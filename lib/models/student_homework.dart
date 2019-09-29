import 'package:f_on/models/quesiton.dart';
import 'package:f_on/models/question_path.dart';
import 'package:f_on/models/schedule_homework.dart';
import 'package:f_on/models/student.dart';
import 'package:flutter/foundation.dart';

class StudentHomework {
  final String id;

  bool isSubmit;
  bool isRevised;
  bool isPass;
  bool isNew;
  String textComment;
  String voiceComment;

  Score score;
  Student student;
  ScheduleHomework scheduleHomework;
  List<PartRecord> partRecords;
  List<QuestionRecord> questionRecords;

  StudentHomework(
      {@required this.id,
      this.isNew,
      this.isPass,
      this.isRevised,
      this.isSubmit,
      this.textComment,
      this.voiceComment});

  factory StudentHomework.fromJSON(Map<String, dynamic> json) {
    var studentHomework = new StudentHomework(
      id: json['id'],
      isNew: json['is_new'],
      isPass: json['is_pass'],
      isRevised: json['is_revised'],
      isSubmit: json['is_submit'],
      textComment: json['text_comment'],
      voiceComment: json['voice_comment'],
    );

    if (json.keys.contains('student')) {
      studentHomework.student = Student.fromJSON(json['student']);
    }

    if (json.keys.contains('schedule_homework')) {
      studentHomework.scheduleHomework =
          ScheduleHomework.fromJSON(json['schedule_homework']);
    }

    if (json['part_record'] is List) {
      (json['part_record'] as List).forEach((_json) {
        studentHomework.partRecords.add(PartRecord.fromJSON(_json));
      });
    }

    if (json['question_record'] is List) {
      (json['question_record'] as List).forEach((_json) {
        studentHomework.questionRecords.add(QuestionRecord.fromJSON(_json));
      });
    }
    return studentHomework;
  }
}

class PartRecord {
  final String id;
  Part part;
  int score;
  int total;
  int right;
  bool isRevised;
  bool isSubmit;

  PartRecord(
      {this.id,
      this.score,
      this.total,
      this.right,
      this.isRevised,
      this.isSubmit});

  factory PartRecord.fromJSON(Map<String, dynamic> json) {
    return new PartRecord(
        id: json['id'],
        score: json['score'],
        total: json['total'],
        right: json['right'],
        isRevised: json['is_revised'],
        isSubmit: json['is_submit']);
  }
}

class QuestionRecord {
  final String id;
  Question question;
  Part part;
  String answer;
  int score;
  String textComment;
  String voiceComment;

  QuestionRecord(
      {this.id, this.answer, this.score, this.textComment, this.voiceComment});

  factory QuestionRecord.fromJSON(Map<String, dynamic> json) {
    return new QuestionRecord(
        id: json['id'],
        answer: json['answer'],
        score: json['score'],
        textComment: json['text_comment'],
        voiceComment: json['voice_comment']);
  }
}

class Score {
  final String id;
  int total;
  int keguan;
  int zhuguan;

  Score({this.id, this.total, this.keguan, this.zhuguan});

  factory Score.fromJSON(Map<String, dynamic> json) {
    return new Score(
        id: json['id'],
        total: json['total'],
        keguan: json['keguan'],
        zhuguan: json['zhuguan']);
  }
}
