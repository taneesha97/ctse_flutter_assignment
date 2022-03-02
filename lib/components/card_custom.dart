import 'package:flutter/material.dart';

import '../constants.dart';

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
    return Container(
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: testingPressFunction,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1,2),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Color(0xFF3C4046)// Add the opacity here.
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight:  Radius.circular(10),
                    ),
                    child: Image.network(
                      name,
                      width: size.width * 0.4,
                      fit: BoxFit.cover,
                      height: 110,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title.toString() + "\n",
                            style: TextStyle(fontFamily: "lato", fontWeight: FontWeight.bold, color: primaryTextColor),
                          ),
                          TextSpan(
                            text: year.toString(),
                            style: TextStyle(fontFamily: "lato", fontWeight: FontWeight.bold, color: secondTextColor, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
