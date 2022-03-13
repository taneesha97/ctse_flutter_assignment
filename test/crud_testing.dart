import 'package:ctse_assignment_1/models/movie.dart';
import 'package:ctse_assignment_1/util/crud_model.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test("Testing the Crud Operations with Firestore Streams.", () async {
    // Arrange.
    final crudModel = CrudModel();

    //Act
    Stream<List<Movie>> movies = crudModel.getListOfMovies;

    // Asset
    print(movies);

  });
}