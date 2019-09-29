import 'package:f_on/models/classroom.dart';
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
                      Image.network(widget.classroom.courseVersion.course.image.url),
                      ListTile(
                        title: Text(widget.classroom.name),
                        subtitle: Text("课程总数"),
                      )
                    ],
                  ))),
          ...(List.generate(
              5,
              (index) => Card(
                  child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text("政治第${index + 1}回"),
                      subtitle: Text('09-17 15:45'),
                      trailing: Stack(
                        children: <Widget>[
                          InkWell(
                              child: Icon(Icons.work),
                              onTap: () {
                                Navigator.pushNamed(context, '/schedule_stat');
                              }),
                        ],
                      )))))
        ],
      ),
    );
  }
}
