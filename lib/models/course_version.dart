import 'package:f_on/models/course.dart';
import 'package:f_on/models/lesson.dart';

class CourseVersion {
  String id;
  Course course;
  String name;
  List<Lesson> lessons;
}
