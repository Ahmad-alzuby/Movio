import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/core/consts/consts.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  Color color = const Color.fromARGB(255, 134, 134, 134);

  FavoriteCubit() : super(FavoriteInit());
  addMovie(
    MovieModel movie,
  ) async {
    emit(EmptyList());

    bool isFav = chechIfFavoriteAlready(movie);
    if (isFav == true) {
      try {
        color = const Color.fromARGB(255, 184, 184, 184);
        await Hive.box<MovieModel>(kfavoriteBox).delete(movie.id);

        emit(MovieAlreadyInFavorite());

        return true;
      } catch (e) {
      return;

      }
    } else if (isFav == false) {
      try {
        emit(EmptyList());
        await Hive.box<MovieModel>(kfavoriteBox).put(movie.id, movie);
        emit(AddMovieState());

        if (Hive.box<MovieModel>(kfavoriteBox).values.contains(movie)) {
          color = Colors.red;
          emit(AddMovieState());
        } else {
          color = const Color.fromARGB(255, 222, 222, 222);
          emit(MovieAlreadyInFavorite());
        }
      } catch (e) {
              return;

      }
    }
  }

  bool chechIfFavoriteAlready(
    MovieModel movie,
  ) {
    if (Hive.box<MovieModel>(kfavoriteBox).containsKey(movie.id)) {
      color = Colors.red;
      return true;
    } else {
      color = const Color.fromARGB(255, 106, 106, 106);

      return false;
    }
  }

  deletProdct(MovieModel movieModel, int index) async {
    try {
      await Hive.box<MovieModel>(kfavoriteBox).delete(movieModel.id!);
    } catch (e) {

      return;
    }
  }
}
