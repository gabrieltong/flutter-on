const ROUNDS = """
  query(\$lessonId: ID!) {
    lesson(id: \$lessonId) {
      intro
      course_version {
        course {
          image {
            filename
            url
          }
          name
        }
      }
    }
    rounds(lessonId: \$lessonId) {
      _id
      name
      pdfs {
        _id
        filename
        url
      }
      videos {
        _id
        filename
        url
        thumbnail
      }
    }
  }
""";
