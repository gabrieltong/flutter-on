import 'package:f_on/models/classroom.dart';
import 'package:f_on/page/teacher_course.dart';
import 'package:flutter/material.dart';

class TeacherCourses extends StatefulWidget {
  final List<Classroom> classrooms;

  TeacherCourses({Key key, @required this.classrooms}) : super(key: key);

  @override
  TeacherCoursesState createState() {
    return TeacherCoursesState();
  }
}

class TeacherCoursesState extends State<TeacherCourses> {
  Widget build(BuildContext context) {
    List<Widget> children = [];

    widget.classrooms.forEach((classroom) {
      children.add(Card(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/teacher_course',
                    arguments: new TCSArgs(classroom.id));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Image.network(
                  // 'https://www.baidu.com/img/dong_a16028f60eed614e4fa191786f32f417.gif'),
                  Image.network(classroom.courseVersion.course.image.url),
                  ListTile(
                    title: Text(classroom.name),
                    subtitle: Text(
                        "进度 ${classroom.progress}/${classroom.schedules.length}"),
                  )
                ],
              ))));
    });

    return ListView(children: children);
  }
}
