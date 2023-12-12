// ignore_for_file: must_be_immutable

part of 'genre_cubit.dart';

@immutable
sealed class GenreState {}

final class GenreInitial extends GenreState {}

final class GenreSuccses extends GenreState {
  List<GenreModel> genre;
  GenreSuccses({required this.genre});
}

final class GenreMoviesSuccses extends GenreState {
  List<MovieModel> movies;
  GenreMoviesSuccses({required this.movies});
}
final class GenreLoading extends GenreState {}
final class GenreFailure extends GenreState {}
