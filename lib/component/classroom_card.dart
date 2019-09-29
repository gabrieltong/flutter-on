import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/share.dart';
import 'package:flutter/material.dart';

class ClassroomCard extends StatelessWidget {
  final Classroom classroom;

  ClassroomCard({Key key, this.classroom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/classroom',
                  arguments: IDArg(classroom.id));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(classroom.courseVersion.course.image.url),
                const ListTile(
                  title: Text('Classroom Cardssss'),
                  subtitle: Text('Classroom Card.....'),
                )
              ],
            )));
  }
}
