// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/home/views/widgets/movie_widget.dart';
import 'package:movio/src/core/appRouter/router_name.dart';

class MoviesExplorListView extends StatelessWidget {
  List<MovieModel> movies;

  MoviesExplorListView({
    required this.movies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      child: SizedBox(
        child: CarouselSlider.builder(
          options: CarouselOptions( 
              viewportFraction: 0.7,
              height: MediaQuery.of(context).size.height * 0.7,
              autoPlayCurve: Curves.ease,
              enlargeCenterPage: true,
              
              autoPlay: true),
          itemCount: movies.length,
          itemBuilder: (context, index, realIndex) => Center(
              child: InkWell(
                  onTap: () {
                    GoRouter.of(context)
                        .push(RouterName.detialsView, extra: movies[index]);
                  },
                  child: Hero(
                    tag: movies[index].id.toString(),
                    child: MoviePosters(
                      height: 0.4,
                      width: 0.7,
                      image:
                          "https://image.tmdb.org/t/p/w500${movies[index].posterPath!}",
                    ),
                  ))),
        ),
      ),
    );
  }
}
