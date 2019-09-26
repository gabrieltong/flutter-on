import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  DefaultLayout({this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 61, 80, 1.0),
        appBar: AppBar(
          title: Text("唯新在线"),
        ),
        // backgroundColor: Color.fromRGBO(0, 61, 80, 1.0),
        body: Container(
            padding: EdgeInsets.lerp(EdgeInsets.all(10), EdgeInsets.all(30), 1),
            child: child));
  }
}
