import 'package:ctse_assignment_1/models/actor.dart';

class MovieActor {
  String id;
  Map<String, dynamic>? actors;

  MovieActor({
    required this.id,
    required this.actors,
  });

  MovieActor.fromMap(Map<String, dynamic> snapshot, String id)
      :
        id = id ?? '',
        actors = snapshot['actors'] ?? '';

  toJson() {
    return {
      "actors": actors,
    };
  }
}