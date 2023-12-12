
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/moreMovies/view/widgets/more_view_widget.dart';

// ignore: must_be_immutable
class MoreViewGridView extends StatelessWidget {
  ScrollController scrollController;
  BuildContext context;
  bool isLoaidng;
  List<MovieModel> movies;
  MoreViewGridView({
    super.key,
    required this.movies,
    required this.isLoaidng,
    required this.scrollController,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(children: [
      Expanded(
        child: AnimationLimiter(
          child: GridView.count(
            controller: scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.all(w / 60),
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.height *
                1 /
                MediaQuery.of(context).size.height *
                0.8,
            children: List.generate(
              movies.length,
              (int index) {
                if (index == movies.length - 1 && isLoaidng) {
                  return const Align(
                      alignment: Alignment.bottomCenter,
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return MoviesGridView(
                      context: context, index: index, movieModel: movies);
                }
              },
            ),
          ),
        ),
      ),
    ]);
  }
}