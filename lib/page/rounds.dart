import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/component/schedule_card.dart';
import 'package:flutter/cupertino.dart';

class RoundsScreen extends StatefulWidget {
  @override
  _RoundsScreenState createState() => _RoundsScreenState();
}

class _RoundsScreenState extends State<RoundsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: ListView(
      children: <Widget>[Text("Round Screen")],
    ));
  }
}
