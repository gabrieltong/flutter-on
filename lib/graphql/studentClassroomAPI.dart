const CLASSROOM_RANK = """
  query(\$classroomId: ID!, \$studentId: ID!) {
    classroomRank(classroomId: \$classroomId) {
      _id
      student_rank
      items {
        total
        score
        right_exam
        student {
          _id
          name
        }
      }
    }
  }
""";

const STUDENT_CLASSROOM_STAT = """
  query(\$classroomId: ID!, \$studentId: ID!) {
    classroomStudentStat(classroomId: \$classroomId, studentId: \$studentId) {
      _id
      homework_rate
      round_rate
      online_rate
      schedule_stats {
        name
        exam_score
        homework_score
        status_round
        status_homework
        status_online
      }
    }
  }
""";

const STUDENT_CLASSROOMS = """
  query {
    studentClassrooms {
      classrooms {
        _id
        name
        status
        progress
        schedules {
          _id
        }
        course_version {
          course {
            image {
              url
            }
            course_group {
              name
            }
          }
        }
      }
      courseGroups
    }
  }
""";

const STUDENT_CLASSROOM = """
  query(\$classroomId: ID!) {
    studentClassroom(classroomId: \$classroomId) {
      _id
      name
      progress
      message
      status
      start_time
      end_time
      nextSchedule {
        _id
        start_time
        status
        scheduleNo
      }
      students {
        _id
        name
        headimgurl
      }
      teacher {
        _id
        name
      }
      schedules {
        _id
        status
        start_time
        lesson {
          _id
          intro
          points
          contents
        }
      }
      course_version {
        course {
          name
          intro
          image {
            url
          }
        }
      }
    }
  }
""";
