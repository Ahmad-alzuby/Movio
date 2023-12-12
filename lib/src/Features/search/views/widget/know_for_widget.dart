

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/home/views/widgets/movie_widget.dart';
import 'package:movio/src/Features/search/models/artists/artistsmodel.dart';
import 'package:movio/src/core/appRouter/router_name.dart';
import 'package:movio/src/core/stryles/text_style.dart';

// ignore: must_be_immutable
class KnowForWidget extends StatelessWidget {
  
    KnowForWidget({
    super.key,
    required this.index,
    required this.artist,
  });

  final Artists artist;
int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(RouterName.detialsView,
              extra: artist.knownFor![index]);
        },
        child: Column(
          children: [
            MoviePosters(
              image:
                  "https://image.tmdb.org/t/p/w500${artist.knownFor![index].posterPath!}",
              height: 0.15,
              width: 0.3,
            ),
            SizedBox(
                width: 100,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  artist.knownFor?[index].title ?? 'Unkown',
                  style: MyTextStyle.textStyle_22(),
                ))
          ],
        ),
      ),
    );
  }
}
