import 'package:flutter/material.dart';

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
          height: MediaQuery.of(context).size.height,
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
                          stops: [
                            0.0,
                            1.0
                          ]
                      )
                    ),
                  )
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Text("Heading Movie"),
                    Text("Description Movie"),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Cast and Crew"),
                    Row(
                      children: [
                        // Custom Card comes here with a horizontal Scroller.
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Quiz Information"),
                    Row(
                      children: [
                        // Quiz information card comes here.
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("Movie Rating"), // Header
                    Text("IMBd Movie Rating = ")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
