import 'package:f_on/models/schedule.dart';
import 'package:f_on/models/schedule_exam.dart';
import 'package:f_on/models/student.dart';

class StudentExam {
  Student student;
  Schedule schedule;
  ExamRecord examRecord;
  int seIndex;
  int rightExam;
  int examLength;
}
