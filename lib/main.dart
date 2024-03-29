import 'package:f_on/page/classroom.dart';
import 'package:f_on/page/classrooms.dart';
import 'package:f_on/page/homework.dart';
import 'package:f_on/page/login.dart';
import 'package:f_on/page/online.dart';
import 'package:f_on/page/rounds.dart';
import 'package:f_on/page/schedule_stat.dart';
import 'package:f_on/page/teacher_course.dart';
import 'package:f_on/page/teacher_courses.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  uri: 'http://192.168.4.83:5000/graphql',
);

final token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZDZmMGRkZmJjNWY0Y2RhNmIzYWJhZGUiLCJlbWFpbCI6Ik1heGltdXMuUHJlZG92aWM1NEBob3RtYWlsLmNvbSIsImlhdCI6MTU2OTc0NzM4NCwiZXhwIjoxNTY5ODMzNzg0fQ.BF-mP5g3AiAoC_yFVCNsuqOtI3frLdfoaCbG798t-Wo';

final AuthLink authLink = AuthLink(
  getToken: () async => "Bearer $token",
);

final Link link = authLink.concat(httpLink);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutterrssss Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );

    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          title: "唯新在线",
          theme: ThemeData(
            fontFamily: 'Rsssht',
            primaryColor: Color.fromRGBO(0, 61, 80, 1.0),
            buttonTheme:
                ButtonThemeData(buttonColor: Color.fromRGBO(0, 170, 154, 1.0)),
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Color.fromRGBO(28, 88, 104, 1.0),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: new BorderRadius.circular(30.0)),
                hintStyle: TextStyle(color: Colors.white)),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginScreen(),
            '/teacher_courses': (context) => TeacherCoursesScreen(),
            '/teacher_course': (context) => TeacherCourseScreen(),
            '/schedule_stat': (context) => ScheduleStatScreen(),
            '/classrooms': (context) => ClassroomsScreen(),
            '/classroom': (context) => ClassroomScreen(),
            '/rounds': (context) => RoundsScreen(),
            '/online': (context) => OnlineScreen(),
            '/homework': (context) => HomeworkScreen(),
          },
        ));
  }
}
