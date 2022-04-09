class UserHistoryModel {
  final String? id, Quiz_ID;
  final int? score;

  UserHistoryModel({this.id, this.Quiz_ID, this.score});

  UserHistoryModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        Quiz_ID = snapshot['Quiz ID'] ?? '',
        score = snapshot['Score'] ?? 0;

  toJson() {
    return {
      "Quiz ID": Quiz_ID,
      "Score": score,
    };
  }
}
