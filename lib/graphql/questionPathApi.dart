const QUESITON_PATH = """
  query(\$lessonId: ID, \$id: ID) {
    questionPath(lessonId: \$lessonId, id: \$id) {
      _id
      name
      sections {
        _id
        name
        parts {
          _id
          name
          full_score
          questions_count
        }
      }
    }
  }
""";

const LESSON_SERIES = """
  query(\$lessonId: ID, \$id: ID) {
    questionPath(lessonId: \$lessonId, id: \$id) {
      _id
      name
    }
  }
""";

const QUESITON_PATH_BY_STUDENT_SCHEDULE = """
  query(\$studentScheduleId: ID!) {
    questionPathByStudentSchedule(studentScheduleId: \$studentScheduleId) {
      _id
      name
      sections {
        _id
        name
        parts {
          _id
          name
        }
      }
    }
  }
""";
