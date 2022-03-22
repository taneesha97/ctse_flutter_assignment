class ResultQuiz{
  // final int? ;//id//time//cattegory//noQuestion
  final String userId;
  // ignore: non_constant_identifier_names
  final int correct_answer, no_questions, wrong_answer, id;

  // ignore: non_constant_identifier_names
  ResultQuiz({required this.id, required this.userId, required this.correct_answer, required this.no_questions, required this.wrong_answer});

  ResultQuiz.fromMap(Map snapshot, String id)
      : id = snapshot['id']  ?? '',
        userId = snapshot['userId'] ?? '',
        correct_answer = snapshot['correct_answer'] ?? '',
        no_questions = snapshot['no_questions'] ?? '',
        wrong_answer = snapshot['wrong_answer'] ?? '';

  toJson() {
    return {
      "id": id,
      "userId": userId,
      "correct_answer": correct_answer,
      "no_questions": no_questions,
      "wrong_answer": wrong_answer
    };
  }
}