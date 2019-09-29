import 'package:f_on/models/quesiton.dart';

class QuestionPath {
  String name;
  String parentId;
  List<Question> questions;
  int fullScore;
  bool hasZhuguan;
}

class Series extends QuestionPath {}

class Section extends Series {}

class Part extends Section {}
