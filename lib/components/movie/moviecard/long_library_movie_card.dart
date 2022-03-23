import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/movie.dart';
import '../../../models/movie_select_model.dart';
import '../../../screens/movie_single.dart';
import '../../../styles.dart';
import '../../../util/crud_model.dart';
import '../validation_pop.dart';

class LongLibraryMovieCard extends StatelessWidget {
  final int index;
  final SelectedMovieModel movie;
  const LongLibraryMovieCard({Key? key, required this.index, required this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onLongPress: (){
            showAltertDialog(context, (){
              // Add the CrudModel Movie Delete Method.
              print("Long Delete");
              // Close Dialog.
              Provider.of<CrudModel>(context, listen: false)
                  .deleteLibraryMovie(movie.id);
              Navigator.pop(context);
            }, (){
              // Close Dialog.
              Navigator.pop(context);
            }, "Do you want to delete this movie?");
          },
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  SingleMoviePage(index: 1,)
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
                    image: NetworkImage(movie.imageUrl.toString()),
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
                              child: Text(movie.title.toString(),
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
                              child: Text(movie.year,
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
                          child: Text(movieList[index].description.toString(),
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
    );
  }
}
