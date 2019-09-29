import 'package:f_on/models/quesiton.dart';
import 'package:flutter/foundation.dart';

class QuestionPath {
  final String id;
  String name;
  String parentId;
  List<Question> questions;
  int fullScore;
  bool hasZhuguan;

  QuestionPath(
      {@required this.id,
      this.name,
      this.parentId,
      this.fullScore,
      this.hasZhuguan});
}

class Series extends QuestionPath {
  Series(
      {@required String id,
      String name,
      String parentId,
      int fullScore,
      bool hasZhuguan})
      : super(
            id: id,
            name: name,
            parentId: parentId,
            fullScore: fullScore,
            hasZhuguan: hasZhuguan);
  factory Series.fromJSON(Map<String, dynamic> json) {
    var series = new Series(
        id: json['_id'],
        name: json['name'],
        parentId: json['parent_id'],
        fullScore: json['full_score'],
        hasZhuguan: json['has_zhuguan']);
    return series;
  }
}

class Section extends Series {
  Section(
      {@required String id,
      String name,
      String parentId,
      int fullScore,
      bool hasZhuguan})
      : super(
            id: id,
            name: name,
            parentId: parentId,
            fullScore: fullScore,
            hasZhuguan: hasZhuguan);
  factory Section.fromJSON(Map<String, dynamic> json) {
    var section = new Section(
        id: json['_id'],
        name: json['name'],
        parentId: json['parent_id'],
        fullScore: json['full_score'],
        hasZhuguan: json['has_zhuguan']);
    return section;
  }
}

class Part extends Section {
  Part(
      {@required String id,
      String name,
      String parentId,
      int fullScore,
      bool hasZhuguan})
      : super(
            id: id,
            name: name,
            parentId: parentId,
            fullScore: fullScore,
            hasZhuguan: hasZhuguan);

  factory Part.fromJSON(Map<String, dynamic> json) {
    var part = new Part(
        id: json['_id'],
        name: json['name'],
        parentId: json['parent_id'],
        fullScore: json['full_score'],
        hasZhuguan: json['has_zhuguan']);
    return part;
  }
}
