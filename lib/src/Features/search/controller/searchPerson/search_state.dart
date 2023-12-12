part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

// ignore: must_be_immutable
final class SearchLoadded extends SearchState {
  List<MovieModel> movies;
  SearchLoadded({required this.movies});
}

final class SearchEmpty extends SearchState {}

final class SearchFailer extends SearchState {}
