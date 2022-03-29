import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctse_assignment_1/models/movie_select_model.dart';
import 'package:ctse_assignment_1/screens/movie_error_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/movie.dart';
import '../../../styles.dart';
import '../../../util/crud_model.dart';
import '../../../util/debouncer.dart';
import '../moviecard/long_movie_card.dart';

class LongMovieCategory extends StatefulWidget {
  final String category;
  String? searchTerm = "";

  LongMovieCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<LongMovieCategory> createState() => _LongMovieCategoryState();
}

class _LongMovieCategoryState extends State<LongMovieCategory> {
  TextEditingController _searchController = TextEditingController();

  Future? resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getMovieDetailsStreamSnapsShots();
  }

  _onSearchChanged() {
   print(_searchController.text); // Listener working.
  }

  searchResultsList() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var movie in _allResults) {
        var title = SelectedMovieModel.fromMap(movie, movie.id, "");
        if (title.title.contains(_searchController.text.toLowerCase())) {
          showResults.add(movie);
        }
      }
    }
  }

  getMovieDetailsStreamSnapsShots() async {
    // User Authentication comes here.
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var movie = SelectedMovieModel(doc.id, doc["title"], doc["imageUrl"], "", doc["description"], doc["rating"], doc["duration"], false, doc["year"]);
        setState(() {
            _allResults.add(movie);
        });
      });
    });

    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {

    // Provider to the fetch all the movies.
    Stream<QuerySnapshot> movies =
        Provider.of<CrudModel>(context, listen: false).movies;

    // Custom Provider.
    Stream<List<SelectedMovieModel>> listMovies =
        Provider.of<CrudModel>(context).getListOfMoviesShort;

    // Debouncer instance.
    final _debouncer = Debouncer(milliseconds: 500);

    // Conditionally select the Provider Method.
    Stream<List<SelectedMovieModel>> movies1;
    if (widget.category == "All Movies") {
      if (widget.searchTerm != "") {
        //print(widget.searchTerm.toString() + "Search 1");
        movies1 = Provider.of<CrudModel>(context)
            .getListOfMoviesShortSearch(widget.searchTerm.toString());
      } else {
        //print(widget.searchTerm.toString() + "Search 2");
        movies1 = Provider.of<CrudModel>(context).getListOfMoviesShort;
      }
    } else {
      movies1 = Provider.of<CrudModel>(context)
          .getMoviesFromCategories(widget.category);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.category,
              style: Styles.textSectionHeader,
            ),
            Text(
              "Custom Libraries to Manage Favorite Movies",
              style: Styles.textSectionSubBody,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: Colors.blueAccent),
              decoration: const InputDecoration(
                hintText: "Enter movie name...",
                contentPadding: EdgeInsets.only(
                  left: 10,
                ),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _debouncer.run(() {
                    widget.searchTerm = value;
                  });
                });
              },
            ),
            Flexible(
                child: StreamBuilder<List<SelectedMovieModel>>(
                  stream: movies1,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return const MovieErrorPage(
                        imageUrl:
                        "https://www.pngall.com/wp-content/uploads/8/Warning-PNG-Picture.png",
                        name: "Error!",
                      );

                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    final data = snapshot.requireData;
                    if (data.length != 0) {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return LongMovieCard(
                            index: index,
                            movie: data[index],
                          );
                        },
                      );
                    } else {
                      return Center(
                          child: Column(
                            children:  [
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage("https://cdn-icons-png.flaticon.com/512/2748/2748558.png"),
                                    )
                                ),
                              ),
                            ],
                          ));
                    }
                  },
                ))
          ],
        )),
      ),
    );
  }
}
