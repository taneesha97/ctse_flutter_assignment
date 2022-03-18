class LeaderBoardModel {
  // final int? ;
  final String? id, version, place, name, image;
  final int? score;
  // final List<dynamic>? options;

  LeaderBoardModel({this.id, this.version, this.place, this.name, this.image, this.score});

  LeaderBoardModel.fromMap(Map snapshot, String id)
      : id = id ?? '',
        version = snapshot['version'] ?? '',
        place = snapshot['place'] ?? '',
        name = snapshot['name'] ?? '',
        image = snapshot['image'] ?? '',
        score = snapshot['score'] ?? '';

  toJson() {
    return {
      "version": version,
      "place": place,
      "name": name,
      "image": image,
      "score": score,
    };
  }
}
