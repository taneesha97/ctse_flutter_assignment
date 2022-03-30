import 'package:flutter/material.dart';

import '../../../models/actor.dart';
import '../../../models/movie.dart';
import '../../../styles.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;
  const ActorCard({Key? key, required this.actor}) : super(key: key);
  final String imageUrl = "https://nettv4u.com/imagine/t/e/l/u/g/u/telugu-actress-eesha-hot-pictures-68.jpg";

  @override
  Widget build(BuildContext context) {
    print(actor);
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        color: Colors.white,
        borderRadius: new BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: (){},
          child: Row(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                      borderRadius: new BorderRadius.circular(100),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(actor.imageUrl),
                      )
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(actor.name, style: Styles.actorCardHeader, overflow: TextOverflow.ellipsis,),
                    Text(actor.character, style: TextStyle(fontSize: 12),),
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
