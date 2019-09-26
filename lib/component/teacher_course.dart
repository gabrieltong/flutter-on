import 'package:flutter/material.dart';

class TeacherCourse extends StatefulWidget {
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
                      Image.asset('assets/images/courses/1.png'),
                      const ListTile(
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text(
                            'Music by Julie Gable. Lyrics by Sidney Stein.'),
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
