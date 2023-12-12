import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/core/api/api.dart';
import 'package:movio/src/core/api/api_end_boint.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  Api api = Api();
  SimilarCubit() : super(SimilarInitial());

  getSimilar({required String idMovie}) async {
      emit(SimilarLoading());

    List<dynamic> similar = await api.getMovies(
        endBouint: ApiEndBoint.similarEndBoiunt(page: 10, id: idMovie));

    try {
      List<MovieModel> similarMove = similar
          .map((similarMovie) => MovieModel.fromJson(similarMovie))
          .toList();
          if (similarMove.isEmpty) {
            emit(SimilarEmpty());
          }else {
            emit(SimilarSuccses(movies: similarMove));
          }
    } catch (e) {
      SimilarFailure();
    }
  }
}
