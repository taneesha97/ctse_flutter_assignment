import 'package:flutter/material.dart';

import '../../../screens/movie_single.dart';
import '../../../styles.dart';

class LongMovieCard extends StatelessWidget {
  const LongMovieCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  SingleMoviePage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              width: 100,
              decoration:  BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://lumiere-a.akamaihd.net/v1/images/p_msmarvel_disneyplus_20899_1e4e7c4d.jpeg"),
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
                height: 150,
                width: queryData.size.width * (67/100),
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
                          Text("The Avengers",
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textSectionHeader,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 3,
                            ),
                            child: Text("2016",
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
                        child: Text("This is the first part of the movie "
                              "app UI tutorial in Flutter. Here you'll learn about "
                              "various flutter widgets like ListView with various "
                              "configurations of it and other widgets like container, "
                              "text, singleChildScrollView etc.",
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
