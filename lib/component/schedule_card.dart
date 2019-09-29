import 'package:f_on/models/schedule.dart';
import 'package:f_on/models/share.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule schedule;

  ScheduleCard({Key key, this.schedule}) : super(key: key);
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
                        Navigator.pushNamed(context, '/rounds',
                            arguments: IDArg(schedule.id));
                      },
                    ),
                    RaisedButton(
                      child: Text("进入直播"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/online',
                            arguments: IDArg(schedule.id));
                      },
                    ),
                    RaisedButton(
                      child: Text("写作业"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/homework',
                            arguments: IDArg(schedule.id));
                      },
                    ),
                  ],
                )
              ],
            )));
  }
}
