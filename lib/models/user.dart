class User {
  String id;
  String email;
  String userName;
  String profileUrl;
  String age;

  User({
    required this.id,
    required this.email,
    required this.userName,
    required this.profileUrl,
    required this.age,
  });

  User.fromMap(Map<String, dynamic> snapshot, String id)
      :
        id = id ?? '',
        userName = snapshot['userName'] ?? '',
        email = snapshot['email'] ?? '',
        profileUrl = snapshot['profileUrl'] ?? '',
        age = snapshot['age'] ?? '';

  toJson() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "profileUrl": profileUrl,
      "age": age,
    };
  }
}