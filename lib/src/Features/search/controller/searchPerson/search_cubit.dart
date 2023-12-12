import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/core/api/api.dart';
import 'package:movio/src/core/api/api_end_boint.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Api api = Api();
  Future<List<MovieModel>> getAllMovies() async {
      emit(SearchLoading());

    List<dynamic> data =
        await api.getMovies(endBouint: "${ApiEndBoint.searchEndBoint}10");
    List<MovieModel> movies =
        data.map((movie) => MovieModel.fromJson(movie)).toList();
    return movies;
  }

  Future<List<MovieModel>> search(String movieName) async {
    try {
      emit(SearchLoading());

      List<MovieModel> queryList = [];
      List<MovieModel> movies = await getAllMovies();

      queryList.addAll(movies.where((element) => element.title!
          .toLowerCase()
          .contains(movieName.toString().toLowerCase())));

      emit(SearchLoadded(movies: queryList));
      if (movieName.isEmpty) {
        emit(SearchInitial());
      }

      return queryList;
    } catch (e) {
      emit(SearchFailer());
      return [];
    }
  }
}
