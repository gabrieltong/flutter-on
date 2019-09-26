import 'package:flutter/material.dart';

class TeacherCourses extends StatefulWidget {
  @override
  TeacherCoursesState createState() {
    return TeacherCoursesState();
  }
}

class TeacherCoursesState extends State<TeacherCourses> {
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(
            10,
            (index) => Card(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/teacher_course');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset('assets/images/courses/1.png'),
                        const ListTile(
                          title: Text('The Enchanted Nightingale'),
                          subtitle: Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.'),
                        )
                      ],
                    )))));
  }
}
