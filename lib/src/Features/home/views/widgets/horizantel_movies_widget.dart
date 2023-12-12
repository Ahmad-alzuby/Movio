
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/home/views/widgets/action_widget.dart';
import 'package:movio/src/Features/home/views/widgets/name_and_see_more.dart';
import 'package:movio/src/core/appRouter/router_name.dart';

class HorizantelMovieListView extends StatelessWidget {
  String title;
  List<MovieModel> movies;
  HorizantelMovieListView({
    required this.movies,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          NameAndSeeMoreWidget(
            title: title,
            onTap: () {
              GoRouter.of(context)
                  .push(RouterName.viewAllMovies, extra: movies[1].id);
            },
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: movies.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ActionMovieWidget(
                    movie: movies[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
