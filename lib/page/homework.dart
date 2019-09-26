import 'package:f_on/component/layouts/default.dart';
import 'package:flutter/cupertino.dart';

class HomeworkScreen extends StatefulWidget {
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: ListView(
      children: <Widget>[Text("Homework Screen")],
    ));
  }
}
