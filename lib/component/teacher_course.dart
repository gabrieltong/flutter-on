import 'package:f_on/models/classroom.dart';
import 'package:f_on/models/share.dart';
import 'package:flutter/material.dart';

class TeacherCourse extends StatefulWidget {
  final Classroom classroom;

  TeacherCourse({Key key, this.classroom}) : super(key: key);

  @override
  TeacherCourseState createState() {
    return TeacherCourseState();
  }
}

class TeacherCourseState extends State<TeacherCourse> {
  Widget build(BuildContext context) {
    List<Widget> schdules = [];
    widget.classroom.schedules.forEach((schedule) {
      schdules.add(Card(
          child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(schedule.lesson.intro),
              subtitle: Text(schedule.sTime),
              trailing: Stack(
                children: <Widget>[
                  InkWell(
                      child: Icon(Icons.work),
                      onTap: () {
                        Navigator.pushNamed(context, '/schedule_stat',
                            arguments: new IDArg(schedule.id));
                      }),
                ],
              ))));
    });
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, '/teacher_course');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.network(
                          widget.classroom.courseVersion.course.image.url),
                      ListTile(
                        title: Text(widget.classroom.name),
                        subtitle: Text("课程总数"),
                      )
                    ],
                  ))),
          ...schdules
        ],
      ),
    );
  }
}
