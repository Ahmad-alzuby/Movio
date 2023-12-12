// ignore_for_file: must_be_immutable

part of 'similar_cubit.dart';

@immutable
sealed class SimilarState {}

final class SimilarInitial extends SimilarState {}
final class SimilarSuccses extends SimilarState {
List<MovieModel> movies;

SimilarSuccses({required this.movies});
}
final class SimilarLoading extends SimilarState {}
final class SimilarFailure extends SimilarState {}
final class SimilarEmpty extends SimilarState {}
