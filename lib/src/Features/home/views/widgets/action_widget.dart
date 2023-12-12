// ignore_for_file: must_be_immutable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/details/controller/cubit/similar_cubit.dart';
import 'package:movio/src/Features/favorite/manger/favorite_cubit.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/home/views/widgets/movie_widget.dart';
import 'package:movio/src/core/appRouter/router_name.dart';
import 'package:movio/src/core/stryles/text_style.dart';
import 'package:flutter/material.dart';

class ActionMovieWidget extends StatelessWidget {
  MovieModel movie;
  ActionMovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SimilarCubit()..getSimilar(idMovie: movie.id.toString()),
        ), 
        BlocProvider(create:  (context) => FavoriteCubit(),)
      ],
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(RouterName.detialsView, extra: movie);
        },
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Hero(
                    tag: movie.id!,
                    child: MoviePosters(
                        height: 0.16,
                        width: 0.3,
                        image:
                            "https://image.tmdb.org/t/p/w500${movie.posterPath}"),
                  )),
              SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    '${movie.title}',
                    style: MyTextStyle.textStyle_12(),
                  ),
                ),
              ),
              Text(
                '${movie.releaseDate}',
                style: MyTextStyle.textStyle_12(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
