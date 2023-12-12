part of 'top_artists_cubit.dart';

@immutable
sealed class TopArtistsState {}

final class TopArtistsInitial extends TopArtistsState {}

// ignore: must_be_immutable
final class TopArtistsSucsses extends TopArtistsState {
  List<Artists> artists;
  TopArtistsSucsses({required this.artists});
}

final class TopArtistsLoading extends TopArtistsState {}

final class TopArtistsFaileur extends TopArtistsState {}
