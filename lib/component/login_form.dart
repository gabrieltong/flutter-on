import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool isTeacher = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              "唯新在线",
              locale: Locale("zh-CN"),
              style: TextStyle(
                  // fontFamily: ,
                  fontSize: 50,
                  // decoration: TextDecoration.lineThrough,
                  color: Colors.white),
            ),
            Container(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Login"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Container(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),

            Container(
              height: 50,
            ),
            // MaterialButton(
            //   color: Colors.red,
            //   padding: EdgeInsets.all(20.0),
            //   child: Text('New button'),
            //   onPressed: (){},
            // ),
            Switch(
              value: this.isTeacher,
              onChanged: (value) {
                setState(() {
                  this.isTeacher = value;
                });
              },
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                // color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, '/teacher_courses');
                },
                padding: const EdgeInsets.all(0),
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "登陆",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text("学生登陆"),
              onPressed: () {
                Navigator.pushNamed(context, '/classrooms');
              },
            )
          ],
        ));
  }
}
