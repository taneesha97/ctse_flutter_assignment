class Library {
  String id;
  String name;
  String optional;


  Library({
    required this.id,
    required this.name,
    required this.optional,
  });

  Library.fromMap(Map<String, dynamic> snapshot)
      :
        id = snapshot["id"] ?? '',
        name = snapshot['name'] ?? '',
        optional = snapshot['optional'] ?? '';


  toJson() {
    return {
      "name": name,
      "optional": optional,
    };
  }
}