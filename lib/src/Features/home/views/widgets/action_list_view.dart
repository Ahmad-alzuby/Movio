// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/home/controller/cubit/home_cubit.dart';
import 'package:movio/src/Features/home/views/widgets/horizantel_movies_widget.dart';
import 'package:movio/src/Features/home/views/widgets/horziantl_list_view_shimmer.dart';

class MoviesListViewHorizantl extends StatelessWidget {
  String title;
    MoviesListViewHorizantl({
      required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      width: double.infinity,
      child: BlocProvider(
        create: (context) => HomeCubit()..getTopMovies(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccsesState) {
              return HorizantelMovieListView(
                  movies: state.movies, title: title);
            } else if (state is HomeFailerState) {
              return Text(state.errormassge);
            } else if (state is HomeLoadingState) {
              return const HoriontalListViewWidgetShimmer();
            }
            return const Text('Unkown error');
          },
        ),
      ),
    );
  }
}
