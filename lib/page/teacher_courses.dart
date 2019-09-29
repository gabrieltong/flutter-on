import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/component/teacher_courses.dart';
import 'package:f_on/graphql/teacherClassroomAPI.dart';
import 'package:f_on/models/classroom.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TeacherCoursesScreen extends StatefulWidget {
  @override
  _TeacherCoursesScreenState createState() => _TeacherCoursesScreenState();
}

class _TeacherCoursesScreenState extends State<TeacherCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document:
              TEACHER_CLASSROOMS, // this is the query string you just created
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.errors != null) {
            return Center(child: Text(result.errors.toString()));
          }

          if (result.loading) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
          print(result.data);

          List<Classroom> classrooms = [];
          (result.data['teacherClassrooms']['classrooms'] as List)
              .forEach((json) {
            classrooms.add(Classroom.fromJSON(json));
          });

          // it can be either Map or List
          // List repositories = result.data['viewer']['repositories']['nodes'];

          return DefaultLayout(child: TeacherCourses(classrooms: classrooms));
        });
  }
}
