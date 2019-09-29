class File {
  String id;
  String filename;
  String url;
}

class Pdf extends File {}

class Audio extends File {}

class Video extends File {}

class Ppt extends File {
  String taskUUID;
  String totalPageSize;
}