import 'package:f_on/models/online.dart';

class Exam {
  final String id;
  Online online;
  String category;
  String title;
  String qScore;
  String answer;
  String note;
  List<String> options;

  Exam(
      {this.id,
      this.online,
      this.category,
      this.title,
      this.qScore,
      this.answer,
      this.note,
      this.options});

  factory Exam.fromJSON(Map<String, dynamic> json) {
    var exam = new Exam(
        id: json['_id'],
        online: json['online'],
        category: json['category'],
        title: json['title'],
        qScore: json['q_score'],
        answer: json['answer'],
        note: json['note'],
        options: json['options']);
    return exam;
  }
}
