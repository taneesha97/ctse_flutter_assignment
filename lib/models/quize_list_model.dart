class QuizList {
  final String? category,id;
  final int? time, questions;

  QuizList({this.id, this.category, this.time, this.questions});

  QuizList.fromMap(Map snapshot, String id)
      : id = id ?? '',
        category = snapshot['category'] ?? '',
        time = snapshot['time'] ?? '',
        questions = snapshot['questions'] ?? '';

  toJson() {
    return {
      "category": category,
      "time": time,
      "questions": questions
    };
  }
}
