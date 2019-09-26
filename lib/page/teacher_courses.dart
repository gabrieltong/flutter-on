import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/component/teacher_courses.dart';
import 'package:flutter/material.dart';

class TeacherCoursesScreen extends StatefulWidget {
  @override
  _TeacherCoursesScreenState createState() => _TeacherCoursesScreenState();
}

class _TeacherCoursesScreenState extends State<TeacherCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: TeacherCourses());
  }
}
