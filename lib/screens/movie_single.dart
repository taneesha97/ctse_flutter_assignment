import 'package:flutter/material.dart';

import '../components/movie/moviecategory/singel_page_header.dart';
import '../models/movie.dart';
import '../styles.dart';

class SingleMoviePage extends StatelessWidget {
  const SingleMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Single Movie",
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
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://lumiere-a.akamaihd.net/v1/images/image_b741f363.jpeg?region=0,0,1920,1080&width=480"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
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
                            const Icon(
                              Icons.bookmark_add,
                              color: Colors.white,
                              size: 30.0,
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
                  reusableWidget: Row(
                    children: const [
                      // Custom Card comes here with a horizontal Scroller.
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
                    Text("IMBd Movie Rating = ", style: Styles.textSectionBody),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
