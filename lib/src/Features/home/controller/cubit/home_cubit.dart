import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/core/api/api.dart';
import 'package:movio/src/core/api/api_end_boint.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Api api = Api();

  Future<List<MovieModel>> getpopulerMovies() async {
    emit(HomeLoadingState());
    try {
      List<dynamic> movies =
          await api.getMovies(endBouint: ApiEndBoint.trendEndBoint);
      List<MovieModel> movieList =
          movies.map((movie) => MovieModel.fromJson(movie)).toList();
      emit(HomeSuccsesState(movies: movieList));
      return movieList;
    } catch (e) {
      emit(HomeFailerState(errormassge: e.toString()));
      return [];
    }
  }

  Future<List<MovieModel>> getTopMovies() async {
    emit(HomeLoadingState());
    try {
      List<dynamic> movies = await api.getMovies(endBouint: ApiEndBoint.topRated);
      List<MovieModel> movieList =
          movies.map((movie) => MovieModel.fromJson(movie)).toList();
      emit(HomeSuccsesState(movies: movieList));
      return movieList;
    } catch (e) {
      emit(HomeFailerState(errormassge: e.toString()));
      return [];
    }
  }
}
