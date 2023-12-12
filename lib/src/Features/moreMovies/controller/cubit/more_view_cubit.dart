import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/core/api/api.dart';
import 'package:movio/src/core/api/api_end_boint.dart';

part 'more_view_state.dart';

class MoreViewCuibt extends Cubit<MoreViewState> {
  ScrollController scrollController = ScrollController();
  bool isLoaidng = true;

  List<MovieModel> moviesList = [];
  Api api = Api();
  int page = 20;
  MoreViewCuibt() : super(MoreViewInital());
  getMoreMovie(String movieId) async {
    try {
      emit(MoreViewLoading());

      List<dynamic> respons = await api.getMovies(
          endBouint: ApiEndBoint.moreMoviesEndBouint(page: page, id: movieId));
      List<MovieModel> movies =
          respons.map((movie) => MovieModel.fromJson(movie)).toList();
      moviesList.addAll(movies);

      emit(MoreViewSuccses(movies: moviesList));
    } catch (e) {

      emit(MoreViewFailure());
    }
  }

  getMoreMovies(String movieId) async {
    try {
      List<dynamic> respons = await api.getMovies(
          endBouint: ApiEndBoint.moreMoviesEndBouint(page: page, id: movieId));

      List<MovieModel> movies =
          respons.map((movie) => MovieModel.fromJson(movie)).toList();
      moviesList.addAll(movies);
      emit(MoreViewSuccses(movies: moviesList));

    } catch (e) {
      emit(MoreViewFailure());
    }
  }
}
