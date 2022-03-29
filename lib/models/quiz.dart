class Question {
  // final int? ;//id//time//cattegory//noQuestion
  final String? question, imageUri, id, answer;
  final List<dynamic>? options;

  Question({this.id, this.question, this.imageUri, this.answer, this.options});

  Question.fromMap(Map snapshot, String id)
      : id = id ?? '',
        question = snapshot['question'] ?? '',
        answer = snapshot['answer'] ?? '',
        options = snapshot['options'] ?? '',
        imageUri = snapshot['imageUri'] ?? '';
        //cattegory = snapshot['cattegory'] ?? '';
        //moviename

  toJson() {
    return {
      "question": question,
      "answer": answer,
      "options": options,
      "imageUri": imageUri
    };
  }
}



