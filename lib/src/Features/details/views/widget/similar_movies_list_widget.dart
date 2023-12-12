
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/details/controller/cubit/similar_cubit.dart';
import 'package:movio/src/Features/details/views/widget/similar_empty_widget.dart';
import 'package:movio/src/Features/details/views/widget/similar_sucsses_widget.dart';
import 'package:movio/src/Features/home/views/widgets/horziantl_list_view_shimmer.dart';
import 'package:movio/src/Features/home/views/widgets/name_and_see_more.dart';
import 'package:movio/src/core/appRouter/router_name.dart';

class SimilarMoviesListWidget extends StatelessWidget {
  int movieId;
  SimilarMoviesListWidget({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        NameAndSeeMoreWidget(title: 'Similar Movies', onTap: () {

          GoRouter.of(context).push(RouterName.viewAllMovies , extra: movieId);
          },),
        BlocProvider(
          create: (context) =>
              SimilarCubit()..getSimilar(idMovie: movieId.toString()),
          child: BlocBuilder<SimilarCubit, SimilarState>(
            builder: (context, state) {
              if (state is SimilarEmpty) {
                return const SimilarEmptyWidget();
              }
              if (state is SimilarFailure) {
                return const Center(
                  child: Text("unkown error"),
                );
              }
              if (state is SimilarSuccses) {
                return   SimilarSuccsesStateWidget(state: state,);
              } else if (state is SimilarLoading) {
                return const SizedBox(
                    height: 300, child: HoriontalListViewWidgetShimmer());
              }
              return const Text('unkwon error');
            },
          ),
        ),
      ],
    );
  }
}
