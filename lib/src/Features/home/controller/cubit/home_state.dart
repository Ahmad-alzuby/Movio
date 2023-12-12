// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccsesState extends HomeState {
  List<MovieModel> movies;
  HomeSuccsesState({required this.movies});
}

final class HomeLoadingState extends HomeState {}

final class HomeFailerState extends HomeState {
  String errormassge;
  HomeFailerState({required this.errormassge});
}
