import 'package:f_on/component/classroom_card.dart';
import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/component/schedule_card.dart';
import 'package:flutter/cupertino.dart';

class ClassroomScreen extends StatefulWidget {
  @override
  _ClassroomScreenState createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: ListView(
      children: <Widget>[
        ClassroomCard(),
        ...List.generate(4, (index) => ScheduleCard())
      ],
    ));
  }
}
