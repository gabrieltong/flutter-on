const STUDENT_SCHEDULES = """
  query(\$classroomId: ID!) {
    studentSchedules(classroomId: \$classroomId) {
      _id
      status {
        round
        homework
      }
      schedule {
        _id
        status
      }
    }
  }
""";

const STUDENT_SCHEDULE = """
  query(\$studentScheduleId: ID!) {
    studentSchedule(studentScheduleId: \$studentScheduleId) {
      _id
      scheduleNo
      classroom {
        name
        teacher {
          name
        }
      }
      schedule {
        _id
        lesson {
          _id
          intro
          contents
          points
          online {
            _id
            ppt {
              filename
              url
            }
            pdfs {
              filename
              url
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
  }
""";
