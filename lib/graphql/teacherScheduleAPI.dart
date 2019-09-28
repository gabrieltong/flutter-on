const REVISE_STUDENT_HOMEWORK = """
  mutation(\$id: ID!, \$input: StudentHomeworkInput) {
    reviseStudentHomework(id: \$id, input: \$input) {
      _id
    }
  }
""";

const DELETE_HOMEWORKS = """
  mutation(\$id: ID!) {
    scheduleRemoveHomeworks(id: \$id) {
      _id
    }
  }
""";

const ADD_STUDENT_HOMEWORK = """
  mutation(\$input: StudentHomeworkInput) {
    addStudentHomework(input: \$input) {
      _id
    }
  }
""";

const ADD_SCHEDULE_HOMEWORK = """
  mutation(\$input: ScheduleHomeworkInput) {
    addScheduleHomework(input: \$input) {
      _id
    }
  }
""";

const EDIT_SCHEDULE = """
  mutation(\$scheduleId: ID!, \$input: ScheduleInput!) {
    editSchedule(scheduleId: \$scheduleId, input: \$input) {
      _id
      status
    }
  }
""";

const SCHEDULE_STAT = """
  query(\$scheduleId: ID!) {
    teacherSchedule(scheduleId: \$scheduleId) {
      _id
      scheduleNo
      status
      schedule_homeworks(filter: { is_first: true }) {
        _id
        is_first
      }
      classroom {
        _id
        name
        teacher {
          _id
          name
        }
        students {
          _id
          name
        }
      }
    }
  }
""";

const REVISE_SCHEDULE_HOMEWORK = """
  query(\$id: ID!) {
    scheduleHomework(id: \$id) {
      _id
      full_score
      zhuguan_score
      keguan_score
      questions_count
      question_path {
        _id
      }
      is_first
    }
    studentHomeworks(filter: { schedule_homework: \$id }) {
      _id
      is_submit
      is_revised
      is_pass
      is_new
      text_comment
      score {
        zhuguan
        keguan
        total
      }
      student {
        _id
        name
      }
      question_record {
        question
        part
        answer
        score
        text_comment
        voice_comment
      }
      part_record {
        part
        total
        right
        score
        is_revised
        is_submit
      }
    }
  }
""";

const TEACHER_SCHEDULE = """
  query(\$scheduleId: ID!) {
    teacherSchedule(scheduleId: \$scheduleId) {
      _id
      scheduleNo
      status
      classroom {
        _id
        name
        teacher {
          _id
          name
        }
        students {
          _id
          name
        }
      }
      lesson {
        _id
        intro
        question_pathes {
          _id
          name
        }
        online {
          _id
          ppt {
            filename
            url
            taskUUID
            totalPageSize
          }
          audios {
            filename
            url
          }
          videos {
            filename
            url
          }
          exams {
            _id
            category
            title
            q_score
            answer
            note
            options
          }
        }
      }
    }
  }
""";
