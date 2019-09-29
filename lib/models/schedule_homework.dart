import 'package:f_on/models/question_path.dart';
import 'package:f_on/models/schedule.dart';

class ScheduleHomework {
  final String id;
  bool isFirst;
  int fullScore;
  int zhuguanScore;
  int keguanScore;
  int questionsCount;

  Schedule schedule;
  Series series;

  ScheduleHomework(
      {this.id,
      this.isFirst,
      this.fullScore,
      this.zhuguanScore,
      this.keguanScore,
      this.questionsCount});

  factory ScheduleHomework.fromJSON(Map<String, dynamic> json) {
    var scheduleHomework = new ScheduleHomework(id: json['_id']);

    if (json.keys.contains('schedule')) {
      scheduleHomework.schedule = Schedule.fromJSON(json['schedule']);
    }

    if (json.keys.contains('series')) {
      scheduleHomework.series = Series.fromJSON(json['series']);
    }

    return scheduleHomework;
  }
}
