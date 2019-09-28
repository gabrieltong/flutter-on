import 'package:f_on/models/course_group.dart';
import 'package:f_on/models/course_version.dart';

class Course {
  String id;
  CourseGroup courseGroup;
  String name;
  Image image;

  String intro;
  List<CourseVersion> courseVersions;
}

class Image {
  String id;
  String filename;
  String url;
}
