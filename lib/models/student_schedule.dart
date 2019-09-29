import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/schedule.dart';
import 'package:f_on/models/student.dart';

class StudentSchedule {
  Student student;
  Schedule schedule;
  Classroom classroom;
  Status status;
}

class Status {
  int round;
  int online;
  int homework;
}
