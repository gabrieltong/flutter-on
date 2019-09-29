import 'package:f_on/models/question_path.dart';

class Question {
  final String id;
  String group;

  // xuanze / tiankong / zhuguan / shuxue
  String category;
  // 阅读材料
  String preTitle;
  // 题干
  String title;
  // 分值
  String qScore;
  // 0:小题 1:单问 2:多问
  String qType;
  // 答案解释
  String answer;
  String note;

  List<String> options = [];
  Part part;

  Question(
      {this.id,
      this.group,
      this.category,
      this.preTitle,
      this.options,
      this.title,
      this.qScore,
      this.qType,
      this.answer,
      this.note});

  factory Question.fromJSON(Map<String, dynamic> json) {
    var question = new Question(
        id: json['_id'],
        group: json['group'],
        category: json['category'],
        preTitle: json['pre_title'],
        title: json['title'],
        qScore: json['q_score'],
        qType: json['q_type'],
        answer: json['answer'],
        options: json['options'],
        note: json['note']);

    if (json.keys.contains('part')) {
      question.part = Part.fromJSON(json['part']);
    }

    return question;
  }
}
