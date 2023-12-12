// ignore_for_file: must_be_immutable

part of 'more_view_cubit.dart';

@immutable
sealed class MoreViewState {}

final class MoreViewInital extends MoreViewState {}
final class MoreViewSuccses extends MoreViewState {
 List<MovieModel> movies;
 MoreViewSuccses({required this.movies});
}
final class MoreViewLoading extends MoreViewState {}
final class MoreViewFailure extends MoreViewState {}
final class SimilarEmpty extends MoreViewState {}
