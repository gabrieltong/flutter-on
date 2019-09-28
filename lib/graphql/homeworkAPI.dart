const QUESTION_RECORDS = """
  query(\$id: ID!, \$partId: ID!) {
    questionRecords(id: \$id, partId: \$partId) {
      question
      answer
      score
    }
  }
""";

const SUBMIT_STUDENT_HOMEWORK = """
  mutation(\$id: ID!, \$input: SubmitStudentHomeworkInput) {
    submitStudentHomework(id: \$id, input: \$input) {
      _id
      part_record {
        part
        is_revised
      }
    }
  }
""";

const EDIT_STUDENT_HOMEWORK = """
  mutation(
    \$studentId: ID!
    \$studentHomeworkId: ID!
    \$questionRecord: [QuestionRecordInput]
    \$isSubmit: Boolean
  ) {
    editStudentHomework(
      studentHomeworkId: \$studentHomeworkId
      input: {
        student: \$studentId
        question_record: \$questionRecord
        is_submit: \$isSubmit
      }
    ) {
      _id
    }
  }
""";

const QUESTIONS_WITH_ANSWER = """
  query(\$studentHomeworkId: ID!, \$partId: ID!) {
    questions(partId: \$partId) {
      _id
      category
      title
      pre_title
      group
      q_score
      answer
      note
      options
    }
    studentHomework(id: \$studentHomeworkId) {
      _id

      part_record {
        part
        score
        total
        right
        is_submit
      }
      question_record {
        question
        part
        answer
        score
      }
      is_submit
      is_revised
      is_pass
      is_new
    }
  }
""";

const QUESTIONS = """
  query(\$partId: ID!) {
    questions(partId: \$partId) {
      _id
      is_answer_empty
      is_note_empty
      category
      title
      pre_title
      group
      q_score
      answer
      note
      options
    }
  }
""";

const STUDENT_HOMEWORKS = """
  query(\$scheduleId: ID!, \$studentId: ID!) {
    studentHomeworks(filter: { schedule: \$scheduleId, student: \$studentId }) {
      _id
      schedule_homework {
        _id
        full_score
        zhuguan_score
        keguan_score
        questions_count
        question_path {
          _id
          name
          sections {
            _id
            name
            parts {
              _id
              name
              questions_count
              has_zhuguan
              full_score
            }
          }
        }
      }
      score {
        keguan
        zhuguan
        total
      }
      is_submit
      is_revised
      is_pass
      is_new
    }
  }
""";

const STUDENT_HOMEWORK_REPORT = """
  query(\$id: ID!, \$byStudent: Boolean) {
    studentHomework(id: \$id, byStudent: \$byStudent) {
      _id
      text_comment
      student {
        _id
        name
      }
      score {
        keguan
        zhuguan
        total
      }
    }
  }
""";

const STUDENT_HOMEWORK = """
  query(\$id: ID!, \$byStudent: Boolean) {
    studentHomework(id: \$id, byStudent: \$byStudent) {
      _id
      part_record {
        part
        score
        total
        right
        is_submit
      }
      question_record {
        question
        part
        answer
        score
      }
      schedule_homework {
        _id
        full_score
        zhuguan_score
        keguan_score
        questions_count
        schedule {
          classroom {
            name
          }
        }
        question_path {
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
      score {
        keguan
        zhuguan
        total
      }
      is_submit
      is_revised
      is_pass
      is_new
    }
  }
""";

const SCHEDULE_HOMEWORKS = """
  query(\$id: ID!) {
    scheduleHomeworks(scheduleId: \$id) {
      question_path {
        _id
        name
      }
    }
  }
""";
