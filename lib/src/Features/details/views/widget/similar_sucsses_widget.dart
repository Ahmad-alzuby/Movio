
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/Features/details/controller/cubit/similar_cubit.dart';
import 'package:movio/src/Features/home/views/widgets/action_widget.dart';

class SimilarSuccsesStateWidget extends StatelessWidget {
  SimilarSuccses state;
    SimilarSuccsesStateWidget({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.movies.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ActionMovieWidget(
                movie: state.movies[index],
              );
            }),
      ),
    );
  }
}
