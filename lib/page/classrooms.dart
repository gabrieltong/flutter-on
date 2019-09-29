import 'package:f_on/component/classroom_card.dart';
import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/graphql/studentClassroomAPI.dart';
import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ClassroomsScreen extends StatefulWidget {
  @override
  _ClassroomsScreenState createState() => _ClassroomsScreenState();
}

class _ClassroomsScreenState extends State<ClassroomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document:
              STUDENT_CLASSROOMS, // this is the query string you just created
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.errors != null) {
            return Center(child: Text(result.errors.toString()));
          }

          if (result.loading) {
            return Text('Loading Student Classroomsss');
          }
          print(result.data);

          List<Classroom> classrooms = [];
          (result.data['studentClassrooms']['classrooms'] as List)
              .forEach((json) {
            classrooms.add(Classroom.fromJSON(json));
          });

          // it can be either Map or List
          // List repositories = result.data['viewer']['repositories']['nodes'];
          List<Widget> children = [];
          classrooms.forEach((classroom) {
            children.add(ClassroomCard(
              classroom: classroom,
            ));
          });

          return DefaultLayout(
              // child: Container(
              child: ListView(children: children));
        });
  }
}
