import 'package:ctse_assignment_1/models/movie_select_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/movie/moviecard/actor_card.dart';
import '../components/movie/moviecategory/singel_page_header.dart';
import '../models/actor.dart';
import '../models/movie.dart';
import '../models/movie_actor.dart';
import '../styles.dart';
import '../util/crud_model.dart';

class SingleMoviePage extends StatefulWidget {
  const SingleMoviePage({Key? key,  required this.index, required this.movie}) : super(key: key);
  final int index;
  final SelectedMovieModel movie;

  @override
  State<SingleMoviePage> createState() => _SingleMoviePageState();
}

class _SingleMoviePageState extends State<SingleMoviePage> {
  final String imageURL = "https://i.ytimg.com/vi/yy8rTU-QSTM/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBvdUVP-UfTIKERUpCUIcCWVwK-5A";

  @override
  Widget build(BuildContext context) {
    // Call the Provider method to get actors details.
    Stream<List<MovieActor>> listOfActors = Provider.of<CrudModel>(context).getActorsFromMovie(widget.movie.id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.movie.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black,
                          ],
                          stops: const [
                            0.1,
                            1.0,
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 8,
                      right: 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.movie.title.toString(),
                              style: Styles.overTheImageTitle,
                            ),
                            GestureDetector(
                              onTap: (){
                                print("");
                              },
                              child: const Icon(
                                Icons.bookmark_add,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                        Text(widget.movie.year.toString(), style: Styles.overTheImageSubTitle),
                      ],
                    ),
                  ),
                ],
              ),
              SinglePageHeader(
                  header: widget.movie.title,
                  reusableWidget: Text(
                    widget.movie.description.toString(),
                    style: Styles.textSectionBody,
                  )),
              SinglePageHeader(
                  header: "Cast and Crew",
                  reusableWidget: Column(
                    children:  [
                      Container(
                        width: 400,
                        height: 90,
                        child: StreamBuilder<List<MovieActor>>(
                          stream: listOfActors,
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              final data = snapshot.requireData;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.first.actors?.length,
                                  itemBuilder: (ctx,i) => Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10
                                    ),
                                    child:  ActorCard(actor: Actor.fromMap(data.first.actors?[(i+1).toString()], "")),
                                  ),
                                );
                            } else if (snapshot.hasError){
                              return Text("Error");
                            } else {
                              return Text("Something Else Happens");
                            }

                          }
                        ),
                      ),
                    ],
                  )),
              SinglePageHeader(
                  header: "Quiz information",
                  reusableWidget: Row(
                    children:  [
                      Text("Quiz:", style: Styles.textSectionBody),
                      Text("10", style: Styles.textSectionBody)
                    ],
                  )),
              SinglePageHeader(
                header: "Movie Rating",
                reusableWidget:
                    Text("Movie Rating: 9.8 ", style: Styles.textSectionBody),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
