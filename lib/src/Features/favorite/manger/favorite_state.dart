part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInit extends FavoriteState {}

final class AddMovieState extends FavoriteState {}

final class MovieAlreadyInFavorite extends FavoriteState {}

final class EmptyList extends FavoriteState {}
