import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movio/src/Features/search/models/artists/artistsmodel.dart';
 import 'package:movio/src/core/api/api.dart';
import 'package:movio/src/core/api/api_end_boint.dart';

part 'top_artists_state.dart';

class TopArtistsCubit extends Cubit<TopArtistsState> {
  TopArtistsCubit() : super(TopArtistsInitial());
  Api api = Api();
  int page = 1;
  getTopArtists() async {
    emit(TopArtistsLoading());
    try {
      List<dynamic> artists = await api.getMovies(endBouint: ApiEndBoint.topArtists(page: page));
      List<Artists> artistsList =
          artists.map((artist) => Artists.fromJson(artist)).toList();
      emit(TopArtistsSucsses(artists: artistsList));
    } catch (e) {
      emit(TopArtistsFaileur());
    }
  }
}
