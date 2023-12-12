import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/Genre/models/genre/genremodel.dart';
import 'package:movio/src/core/api/api.dart';
import 'package:movio/src/core/api/api_end_boint.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  Api api = Api();
  GenreCubit() : super(GenreInitial());
  
  getMoviesBygenre(int id)async{
    emit(GenreLoading());

try {
   List<dynamic> respons = await api.getMovies(endBouint: ApiEndBoint.genreMovies(id: id));
List<MovieModel> movies =   respons.map((movie) => MovieModel.fromJson(movie)).toList();
emit(GenreMoviesSuccses(movies: movies));
} catch (e) {
  emit(GenreFailure());
}
  }
  getGenre()async{
    emit(GenreLoading());

    List<dynamic> respons = await api.getGenre(endBouint: ApiEndBoint.genres);
List<GenreModel> genres =   respons.map((genre) => GenreModel.fromJson(genre)).toList();
emit(GenreSuccses(genre: genres));
  }
}