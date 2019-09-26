import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, '/classroom');
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text('Schedule Card'),
                  subtitle: Text('Schedule Card.....'),
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("预习"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/rounds');
                      },
                    ),
                    RaisedButton(
                      child: Text("进入直播"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/online');
                      },
                    ),
                    RaisedButton(
                      child: Text("写作业"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/homework');
                      },
                    ),
                  ],
                )
              ],
            )));
  }
}
