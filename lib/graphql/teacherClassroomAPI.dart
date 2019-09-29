const TEACHER_CLASSROOMS = """
  query {
    teacherClassrooms {
      classrooms {
        _id
        name
        status
        progress
        schedules {
          _id
        }
        course_version {
          _id
          course {
            _id
            image {
              _id
              url
            }
            course_group {
              _id
              name
            }
          }
        }
      }
      courseGroups
    }
  }
""";

const TEACHER_CLASSROOM = """
  query(\$classroomId: ID!) {
    teacherClassroom(classroomId: \$classroomId) {
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
          image {
            url
          }
        }
      }
    }
  }
""";
