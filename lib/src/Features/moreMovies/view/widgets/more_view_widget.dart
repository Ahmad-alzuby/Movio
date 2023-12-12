
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/home/views/widgets/movie_widget.dart';
import 'package:movio/src/core/appRouter/router_name.dart';
import 'package:movio/src/core/stryles/text_style.dart';

// ignore: must_be_immutable
class MoviesGridView extends StatelessWidget {
  BuildContext context;
  int index;
  List<MovieModel> movieModel;
  MoviesGridView(
      {super.key,
      required this.context,
      required this.index,
      required this.movieModel,  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(RouterName.detialsView, extra: movieModel[index]);
      },
      child:   Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(66, 255, 255, 255),
                            blurRadius: 9,
                            spreadRadius: 0.3,
                          )
                        ]),
                        child: MoviePosters(
                          image:
                              "https://image.tmdb.org/t/p/w500${movieModel[index].posterPath}",
                          height: 0.2,
                          width: 1,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.95),
                      child: Text(
                        movieModel[index].title!,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.textStyle_18(),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(1, -1),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(148, 0, 0, 0),
                              blurRadius: 10,
                              spreadRadius: 2)
                        ]),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                            ),
                            Text(
                              movieModel[index].voteAverage.toString(),
                              style: MyTextStyle.textStyle_18()
                                  .copyWith(color: Colors.yellow),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
