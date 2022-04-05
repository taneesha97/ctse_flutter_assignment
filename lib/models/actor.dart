class Actor {
  String id;
  String name;
  String imageUrl;
  String character;

  Actor({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.character,
  });

  Actor.fromMap(Map<String, dynamic> snapshot, String id)
      :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        imageUrl = snapshot['imageUrl'] ?? '',
        character = snapshot['character'] ?? '';

  toJson() {
    return {
      "name": name,
      "optional": imageUrl,
      "color": character,
    };
  }
}