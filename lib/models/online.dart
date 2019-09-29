import 'package:f_on/models/exam.dart';
import 'package:f_on/models/file.dart';
import 'package:f_on/models/lesson.dart';

class Online {
  final String id;
  Ppt ppt;
  List<Pdf> pdfs;
  List<Audio> audios;
  List<Video> videos;
  List<Video> knowVideos;
  Lesson lesson;
  List<Exam> exams;

  Online({this.id});

  factory Online.fromJSON(Map<String, dynamic> json) {
    var online = new Online(id: json['id']);

    if (json['pdfs'] is List) {
      (json['pdfs'] as List).forEach((_json) {
        online.pdfs.add(Pdf.fromJSON(_json));
      });
    }

    if (json['audios'] is List) {
      (json['audios'] as List).forEach((_json) {
        online.audios.add(Audio.fromJSON(_json));
      });
    }

    if (json['know_videos'] is List) {
      (json['know_videos'] as List).forEach((_json) {
        online.knowVideos.add(Video.fromJSON(_json));
      });
    }
    if (json['videos'] is List) {
      (json['videos'] as List).forEach((_json) {
        online.videos.add(Video.fromJSON(_json));
      });
    }

    if (json['exams'] is List) {
      (json['exams'] as List).forEach((_json) {
        online.exams.add(Exam.fromJSON(_json));
      });
    }

    if (json.keys.contains('lesson')) {
      online.lesson = Lesson.fromJSON(json['lesson']);
    }

    return online;
  }
}
