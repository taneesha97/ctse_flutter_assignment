class Actor {
  String id;
  String name;
  String profileUrl;
  String character;

  Actor({
    required this.id,
    required this.name,
    required this.profileUrl,
    required this.character,
  });

  Actor.fromMap(Map<String, dynamic> snapshot, String id)
      :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        profileUrl = snapshot['optional'] ?? '',
        character = snapshot['color'] ?? '';

  toJson() {
    return {
      "name": name,
      "optional": profileUrl,
      "color": character,
    };
  }
}