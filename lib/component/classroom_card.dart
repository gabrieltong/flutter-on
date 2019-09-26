import 'package:flutter/material.dart';

class ClassroomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/classroom');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset('assets/images/courses/1.png'),
                const ListTile(
                  title: Text('Classroom Card'),
                  subtitle: Text('Classroom Card.....'),
                )
              ],
            )));
  }
}
