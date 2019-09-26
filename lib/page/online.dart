import 'package:f_on/component/layouts/default.dart';
import 'package:f_on/component/schedule_card.dart';
import 'package:flutter/cupertino.dart';

class OnlineScreen extends StatefulWidget {
  @override
  _OnlineScreenState createState() => _OnlineScreenState();
}

class _OnlineScreenState extends State<OnlineScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: ListView(
      children: <Widget>[Text("Online Screen")],
    ));
  }
}
