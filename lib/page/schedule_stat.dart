import 'package:f_on/component/layouts/default.dart';
import 'package:flutter/material.dart';

class ScheduleStatScreen extends StatefulWidget {
  @override
  _ScheduleStatScreenState createState() => _ScheduleStatScreenState();
}

class _ScheduleStatScreenState extends State<ScheduleStatScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: Container(child: Text("Schedule Stat")));
  }
}
