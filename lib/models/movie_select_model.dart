class SelectedMovieModel {
  String id;
  String title, imageUrl;
  String year;
  String libraryId;
  String description;
  bool isSelected;
  String rating;
  String duration;


  SelectedMovieModel(
    this.id,
    this.title,
    this.imageUrl,
    this.libraryId,
    this.description,
    this.rating,
    this.duration,
    this.isSelected,
    this.year,
  );

  SelectedMovieModel.fromMap(Map<String, dynamic> snapshot, String id, String libraryId) :
        id = id ?? '',
        title = snapshot['title'] ?? '',
        imageUrl = snapshot['imageUrl'] ?? '',
        description = snapshot['description'] ?? '',
        rating = snapshot['rating'] ?? '',
        year = snapshot['year'] ?? '',
        duration = snapshot['duration'] ?? '',
        libraryId = snapshot['libraryId'] ?? libraryId,
        isSelected = snapshot['isSelected'] ?? false;



  toJson() {
    return {
      "title": title,
      "imageUrl": imageUrl,
      "description": description,
      "rating": rating,
      "year" : year,
      "duration": duration,
      "libraryId": libraryId,
    };
  }
}
