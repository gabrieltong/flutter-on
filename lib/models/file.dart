import 'package:flutter/foundation.dart';

class File {
  String id;
  String filename;
  String url;
  File({@required this.id, this.filename, this.url});
}

class Pdf extends File {
  factory Pdf.fromJSON(Map<String, dynamic> json) {
    return new Pdf(
        id: json['_id'], filename: json['filename'], url: json['url']);
  }
  Pdf({String id, String filename, String url})
      : super(id: id, filename: filename, url: url);
}

class Audio extends File {
  factory Audio.fromJSON(Map<String, dynamic> json) {
    return new Audio(
        id: json['_id'], filename: json['filename'], url: json['url']);
  }
  Audio({String id, String filename, String url})
      : super(id: id, filename: filename, url: url);
}

class Video extends File {
  factory Video.fromJSON(Map<String, dynamic> json) {
    return new Video(
        id: json['_id'], filename: json['filename'], url: json['url']);
  }
  Video({String id, String filename, String url})
      : super(id: id, filename: filename, url: url);
}

class Ppt extends File {
  String taskUUID = '';
  int totalPageSize = 0;
  factory Ppt.fromJSON(Map<String, dynamic> json) {
    return new Ppt(
        id: json['_id'],
        filename: json['filename'],
        url: json['url'],
        taskUUID: json['taskUUID'],
        totalPageSize: json['totalPageSize']);
  }

  Ppt(
      {String id,
      String filename,
      String url,
      this.taskUUID,
      this.totalPageSize})
      : super(id: id, filename: filename, url: url);
}

class Image extends File {
  factory Image.fromJSON(Map<String, dynamic> json) {
    return new Image(
        id: json['_id'], filename: json['filename'], url: json['url']);
  }
  Image({String id, String filename, String url})
      : super(id: id, filename: filename, url: url);
}
