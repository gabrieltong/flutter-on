import 'package:f_on/graphql/homeworkAPI.dart';

void submitStudentHomework(id) async {
  const [submitStudentHomeworkMutation] = useMutation(
    SUBMIT_STUDENT_HOMEWORK,
    {}
  );
  var refetchQueries = [];

  refetchQueries.add({
    query: STUDENT_HOMEWORK,
    variables: {
      id
    }
  });

  await submitStudentHomeworkMutation({
    variables: {
      id,
      input: {
        isSubmit: true
      }
    },
    refetchQueries
  });
}

export default submitStudentHomework;
