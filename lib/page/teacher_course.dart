import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/component/teacher_course.dart';
import 'package:flutter/material.dart';

class TeacherCourseScreen extends StatefulWidget {
  @override
  _TeacherCourseScreenState createState() => _TeacherCourseScreenState();
}

class _TeacherCourseScreenState extends State<TeacherCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: TeacherCourse());
  }
}
