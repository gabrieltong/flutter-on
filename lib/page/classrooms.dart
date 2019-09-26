import 'package:f_on/component/classroom_card.dart';
import 'package:f_on/component/layouts/default.dart';
import 'package:flutter/cupertino.dart';

class ClassroomsScreen extends StatefulWidget {
  @override
  _ClassroomsScreenState createState() => _ClassroomsScreenState();
}

class _ClassroomsScreenState extends State<ClassroomsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        // child: Container(
        child: ListView(
      children: <Widget>[...List.generate(4, (index) => ClassroomCard())],
    ));
  }
}
