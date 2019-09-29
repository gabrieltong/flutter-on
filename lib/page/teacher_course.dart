import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/component/teacher_course.dart';
import 'package:f_on/graphql/teacherClassroomAPI.dart';
import 'package:f_on/models/classroom.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TCSArgs {
  final String id;
  TCSArgs(this.id);
}

class TeacherCourseScreen extends StatefulWidget {
  @override
  _TeacherCourseScreenState createState() => _TeacherCourseScreenState();
}

class _TeacherCourseScreenState extends State<TeacherCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final TCSArgs args = ModalRoute.of(context).settings.arguments;
    return Query(
        options: QueryOptions(
            document:
                TEACHER_CLASSROOM, // this is the query string you just created
            variables: {'classroomId': args.id}),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.errors != null) {
            return Center(child: Text(result.errors.toString()));
          }

          if (result.loading) {
            return Text('Loading Classrooms');
          }
          print(result.data);

          Classroom classroom =
              Classroom.fromJSON(result.data['teacherClassroom']);

          // it can be either Map or List
          // List repositories = result.data['viewer']['repositories']['nodes'];

          return DefaultLayout(child: TeacherCourse(classroom: classroom));
        });
  }
}
