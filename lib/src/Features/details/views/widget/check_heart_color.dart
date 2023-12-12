import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/favorite/manger/favorite_cubit.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';

class ChechHeartColor extends StatelessWidget {
  const ChechHeartColor({
    super.key,
    required this.movies,
  });

  final MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 10,
      child: BlocProvider(
        create: (context) => FavoriteCubit(),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is AddMovieState || state is MovieAlreadyInFavorite) {
              return IconButton(
                onPressed: () async {
                  await context.read<FavoriteCubit>().addMovie(movies);
                },
                icon: Icon(
                  Icons.favorite,
                  shadows: [
                    Shadow(
                      blurRadius: 20,
                      color: context
                              .read<FavoriteCubit>()
                              .chechIfFavoriteAlready(movies)
                          ? Colors.red
                          : const Color.fromARGB(255, 103, 103, 103),
                    )
                  ],
                  color: context.read<FavoriteCubit>().color,
                  size: 38,
                ),
              );
            }
            return IconButton(
              onPressed: () async {
                await context.read<FavoriteCubit>().addMovie(movies);
              },
              icon: Icon(
                shadows: [
                  Shadow(
                    blurRadius: 20,
                    color: context
                            .read<FavoriteCubit>()
                            .chechIfFavoriteAlready(movies)
                        ? Colors.red
                        : const Color.fromARGB(255, 103, 103, 103),
                  )
                ],
                Icons.favorite,
                color:
                    context.read<FavoriteCubit>().chechIfFavoriteAlready(movies)
                        ? Colors.red
                        : const Color.fromARGB(255, 103, 103, 103),
                size: 38,
              ),
            );
          },
        ),
      ),
    );
  }
}
