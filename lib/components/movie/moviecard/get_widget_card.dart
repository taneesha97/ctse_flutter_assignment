import 'package:flutter/material.dart';

import '../../../styles.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 170,
                width: 160,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
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
                    child: Flexible(
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
                  ),
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0),
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
          )
        ],
      ),
    );
  }
}
