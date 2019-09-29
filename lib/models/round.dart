import 'package:f_on/models/file.dart';
import 'package:f_on/models/lesson.dart';
import 'package:flutter/foundation.dart';

class Round {
  final String id;
  String name;
  List<Pdf> pdfs;
  List<Video> videos;
  Lesson lesson;

  Round({@required this.id, this.name, this.pdfs, this.videos, this.lesson});

  factory Round.fromJSON(Map<String, dynamic> json) {
    var round = new Round(id: json['_id'], name: json['name']);

    if (json['pdfs'] is List) {
      (json['pdfs'] as List).forEach((_json) {
        round.pdfs.add(Pdf.fromJSON(_json));
      });
    }

    if (json['videos'] is List) {
      (json['videos'] as List).forEach((_json) {
        round.videos.add(Video.fromJSON(_json));
      });
    }

    if (json.keys.contains('lesson')) {
      round.lesson = Lesson.fromJSON(json['lesson']);
    }

    return round;
  }
}
