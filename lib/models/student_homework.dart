import 'package:f_on/models/quesiton.dart';
import 'package:f_on/models/question_path.dart';
import 'package:f_on/models/schedule_homework.dart';
import 'package:f_on/models/student.dart';

class StudentHomework {
  Student student;
  ScheduleHomework scheduleHomework;
  List<PartRecord> partRecords;
  List<QuestionRecord> questionRecords;
  Score score;
  bool isSubmit;
  bool isRevised;
  bool isPass;
  bool isNew;
  String textComment;
  String voiceComment;
}

class PartRecord {
  Part part;
  int score;
  int total;
  int right;
  bool isRevised;
  bool isSubmit;
}

class QuestionRecord {
  Question question;
  Part part;
  String answer;
  int score;
  String textComment;
  String voiceComment;
}

class Score {
  int total;
  int keguan;
  int zhuguan;
}
