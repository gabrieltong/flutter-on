import 'package:f_on/component/layouts/default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundsScreen extends StatefulWidget {
  @override
  _RoundsScreenState createState() => _RoundsScreenState();
}

class _RoundsScreenState extends State<RoundsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: ListView(
      children: <Widget>[
        ListView(children: <Widget>[
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ...List.generate(
                  20,
                  (index) => ListTile(
                        title: Text("$index"),
                      ))
            ],
          )
        ])
      ],
    ));
  }
}
