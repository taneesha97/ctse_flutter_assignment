import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/movie.dart';
import '../../../models/movie_select_model.dart';
import '../../../screens/movie_single.dart';
import '../../../styles.dart';
import '../../../util/crud_model.dart';
import '../validation_pop.dart';

class LongLibraryMovieCard extends StatefulWidget {
  final int index;
  final SelectedMovieModel movie;
  const LongLibraryMovieCard({Key? key, required this.index, required this.movie}) : super(key: key);

  @override
  State<LongLibraryMovieCard> createState() => _LongLibraryMovieCardState();
}

class _LongLibraryMovieCardState extends State<LongLibraryMovieCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Dismissible(
      key: Key(widget.movie.id.toString()),
      confirmDismiss: (direction) async {
        showAltertDialog(context, (){
          // Close Dialog.
          Provider.of<CrudModel>(context, listen: false)
              .deleteLibraryMovie(widget.movie.id);
          Navigator.of(context, rootNavigator: true).pop();
        }, (){
          // Close Dialog.
          Navigator.of(context, rootNavigator: true).pop();
        }, "Do you want to delete this movie?");
      },

      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onLongPress: (){
              // Long Press is empty.
            },
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  SingleMoviePage(index: 1,movie: widget.movie,)
                ),
              );
            },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration:  BoxDecoration(
                    image:   DecorationImage(
                      image: NetworkImage(widget.movie.imageUrl.toString()),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 100,
                    width: queryData.size.width * (62.2/100),
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(widget.movie.title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.smallCardHeader,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 3,
                                ),
                                child: Text(widget.movie.year,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textSectionBody,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Flexible(
                            child: Text(movieList[widget.index].description.toString(),
                              style: Styles.textSectionSubBody,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
