import 'package:f_on/models/course_version.dart';
import 'package:f_on/models/online.dart';
import 'package:f_on/models/question_path.dart';
import 'package:f_on/page/rounds.dart';

class Lesson {
  CourseVersion courseVersion;
  String intro;
  String contents;
  String points;
  List<Round> rounds;
  List<Series> serieses;
  Online online;
}