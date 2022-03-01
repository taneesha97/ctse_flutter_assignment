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
  final String name = "https://picsum.photos/250?image=9"; // Testing
  final int? year;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding / 2,
        bottom: defaultPadding *2.5,
      ),

      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.network(name),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,10),
                    blurRadius: 50,
                    color:  primaryColor, // Add the opacity here.
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: year.toString(),
                          style: TextStyle(
                            color: primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
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
