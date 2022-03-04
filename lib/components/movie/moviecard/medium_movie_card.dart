import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../screens/movie_single.dart';
import '../../../styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    // Input Parameters.
    Key? key,
    this.image,
    this.title,
    this.year,
    this.press,

  }) : super(key: key);

  // Attributes. (Card)
  final String? image, title;
  final String name = "https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png"; // Testing
  final int? year;
  final Function()? press;

  void testingPressFunction () {
    print ("Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: Column(
          children: [
            Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://lumiere-a.akamaihd.net/v1/images/p_avengersendgame_19751_e14a0104.jpeg"),
                  )
              ),
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("The Avengers",
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textSectionHeader,
                      ),
                      Text("2016",
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textSectionBody,
                      ),
                    ],
                  ),
                ),
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
