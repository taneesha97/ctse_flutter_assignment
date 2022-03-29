class Library {
  String id;
  String name;
  String optional;
  String color;


  Library({
    required this.id,
    required this.name,
    required this.optional,
    required this.color,
  });

  Library.fromMap(Map<String, dynamic> snapshot, String id)
      :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        optional = snapshot['optional'] ?? '',
        color = snapshot['color'] ?? '';


  toJson() {
    return {
      "name": name,
      "optional": optional,
      "color": color,
    };
  }
}