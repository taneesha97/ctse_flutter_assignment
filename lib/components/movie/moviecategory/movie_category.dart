import 'package:flutter/material.dart';
import '../../../styles.dart';
import '../moviecard/get_widget_card.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: const Text("View All"),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              MovieCard(),
              MovieCard(),
              MovieCard(),
              MovieCard(),
              MovieCard(),
            ],
          ),
        )
      ],
    );
  }
}
