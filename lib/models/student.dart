import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/course_group.dart';

abstract class Person {
  String email;
  String name;
  String headimgurl;
  List<Classroom> classrooms;
}

class Student extends Person {
  String unionid;
}

class Teacher extends Person {
  List<CourseGroup> courseGroups;
}
