import 'package:flutter/material.dart';
import '../components/movie/moviecard/actor_card.dart';
import '../components/movie/moviecategory/singel_page_header.dart';
import '../models/movie.dart';
import '../styles.dart';

class SingleMoviePage extends StatelessWidget {
  const SingleMoviePage({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieList[2].title.toString(),
          style: Styles.navBarTitle,
        ),
      ),
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
                            movieList[2].imageUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 260,
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
                            0.0,
                            1.0
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "This is Movie Title",
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
                        Text("2007", style: Styles.overTheImageSubTitle),
                      ],
                    ),
                  ),
                ],
              ),
              SinglePageHeader(
                  header: "Heading Movie",
                  reusableWidget: Text(
                    movieList[3].description.toString(),
                    style: Styles.textSectionBody,
                  )),
              SinglePageHeader(
                  header: "Cast and Crew",
                  reusableWidget: Column(
                    children:  [
                      Container(
                        width: 400,
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (ctx,i) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10
                            ),
                            child: const ActorCard(),
                          ),
                        ),
                      ),
                    ],
                  )),
              SinglePageHeader(
                  header: "Quiz information",
                  reusableWidget: Row(
                    children: const [
                      // Custom Card comes here with a horizontal Scroller.
                    ],
                  )),
              SinglePageHeader(
                header: "Movie Rating",
                reusableWidget:
                    Text("IMBd Movie Rating 9.8 ", style: Styles.textSectionBody),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
