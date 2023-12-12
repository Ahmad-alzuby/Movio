// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/Features/details/views/widget/check_heart_color.dart';
import 'package:movio/src/Features/details/views/widget/movie_info_widget.dart';
import 'package:movio/src/Features/details/views/widget/similar_movies_list_widget.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/home/views/widgets/movie_widget.dart';
import 'package:movio/src/core/consts/colors.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class DetailsViewBodyWidget extends StatelessWidget {
  final MovieModel movies;

  const DetailsViewBodyWidget({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      child: Hero(
                        tag: movies.id.toString(),
                        child: MoviePosters(
                          height: 0.35,
                          width: 1,
                          image:
                              "https://image.tmdb.org/t/p/w500${movies.posterPath}",
                        ),
                      ),
                    ),
                    ChechHeartColor(movies: movies),
                  ],
                ),
                Container(
                  height: 20,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 70,
                        blurRadius: 100,
                        color: MyColor.primeryColor,
                      ),
                    ],
                  ),
                ),
                MovieDetailsInfo(
                  firstTitle: 'Director',
                  firstValue: movies.title ?? 'unknown',
                  secoundTitle: "Year",
                  secoundValue: movies.releaseDate ?? "unknown",
                ),
                const SizedBox(
                  height: 16,
                ),
                MovieDetailsInfo(
                  firstTitle: 'Video',
                  firstValue: movies.video == null ? 'No' : '${movies.video}',
                  secoundTitle: "Views",
                  secoundValue: "${movies.popularity.toString()} K",
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  movies.overview ?? "unknown",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.textStyle_16().copyWith(
                    fontWeight: FontWeight.normal,
                    color: MyColor.textColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: MyColor.primeryColor,
                  ),
                  child: SimilarMoviesListWidget(
                    movieId: movies.id!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
