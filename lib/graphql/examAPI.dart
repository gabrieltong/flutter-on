const ADD_SCHEDULE_EXAM = """
  mutation(\$scheduleId: ID!) {
    addScheduleExam(input: { schedule: \$scheduleId }) {
      _id
    }
  }
""";

const ADD_STUDENT_EXAM = """
  mutation(
    \$studentId: ID!
    \$scheduleId: ID!
    \$examRecord: [ExamRecordInput]
    \$rightExam: Int!
  ) {
    addStudentExam(
      input: {
        student: \$studentId
        schedule: \$scheduleId
        exam_record: \$examRecord
        right_exam: \$rightExam
      }
    ) {
      _id
    }
  }
""";

const FINISH_SCHEDULE_EXAM = """
  mutation(\$scheduleId: ID!) {
    finishScheduleExam(scheduleId: \$scheduleId) {
      _id
      student_exams {
        _id
        right_exam
        exam_length
      }
      exam_record {
        _id
        exam {
          _id
          category
          title
          q_score
          answer
          note
          options
        }
        right_count
      }
      submit_num
    }
  }
""";

const SCHEDULE_EXAM = """
  query(\$scheduleId: ID!, \$studentId: ID) {
    scheduleExam(schedule: \$scheduleId, student: \$studentId) {
      _id
      exam_record {
        _id
        exam {
          _id
          category
          title
          q_score
          answer
          note
          options
        }
        right_count
        answer
      }
      submit_num
    }
  }
""";
