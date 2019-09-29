import 'package:f_on/models/exam.dart';
import 'package:f_on/models/schedule.dart';

class ScheduleExam {
  Schedule schedule;
  ExamRecord examRecord;
  int submitNum;
}

class ExamRecord {
  Exam exam;
  int rightCount;
}
