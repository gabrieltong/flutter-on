import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/course_group.dart';
import 'package:flutter/foundation.dart';

class Person {
  final String id;
  String email;
  String name;
  String headimgurl;
  List<Classroom> classrooms = [];

  Person({@required this.id, this.email, this.name, this.headimgurl});
}

class Student extends Person {
  String unionid;

  factory Student.fromJSON(Map<String, dynamic> json) {
    var student = new Student(
        id: json['_id'],
        unionid: json['unionid'],
        name: json['name'],
        headimgurl: json['headimgurl'],
        email: json['email']);

    if (json['classrooms'] is List) {
      (json['classrooms'] as List).forEach((_json) {
        student.classrooms.add(Classroom.fromJSON(_json));
      });
    }

    return student;
  }

  Student(
      {this.unionid,
      @required String id,
      String name,
      String headimgurl,
      String email})
      : super(id: id, email: email, headimgurl: headimgurl, name: name);
}

class Teacher extends Person {
  List<CourseGroup> courseGroups = [];

  factory Teacher.fromJSON(Map<String, dynamic> json) {
    var teacher = new Teacher(
        id: json['_id'],
        name: json['name'],
        headimgurl: json['headimgurl'],
        email: json['email']);

    if (json['classrooms'] is List) {
      (json['classrooms'] as List).forEach((_json) {
        teacher.classrooms.add(Classroom.fromJSON(_json));
      });
    }

    if (json['course_groups'] is List) {
      (json['course_groups'] as List).forEach((_json) {
        teacher.courseGroups.add(CourseGroup.fromJSON(_json));
      });
    }

    return teacher;
  }

  Teacher({@required String id, String name, String headimgurl, String email})
      : super(id: id, email: email, headimgurl: headimgurl, name: name);
}
