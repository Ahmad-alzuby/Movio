// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/Genre/cubit/genre_cubit.dart';
import 'package:movio/src/Features/Genre/models/genre/genremodel.dart';
import 'package:movio/src/Features/home/views/widgets/skeelton_widget.dart';
import 'package:movio/src/Features/moreMovies/view/widgets/more_view_widget.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class MoviesGenreView extends StatelessWidget {
  GenreModel genreModel;
  MoviesGenreView({super.key, required this.genreModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        if (state is GenreLoading) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.height *
                  1 /
                  MediaQuery.of(context).size.height *
                  0.8,
            ),
            itemCount: 20,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SkeltoonWidget(height: 0.19, width: 2),
                  const SizedBox(
                    height: 10,
                  ),
                  SkeltoonWidget(height: 0.02, width: 0.5),
                ],
              ),
            ),
          );
        } else if (state is GenreMoviesSuccses) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                      Center(
                        child: Text(
                          "${genreModel.genreName} Movies",
                          style: MyTextStyle.textStyle_24(),
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.height *
                                    1 /
                                    MediaQuery.of(context).size.height *
                                    0.8,
                          ),
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) => MoviesGridView(
                              context: context,
                              index: index,
                              movieModel: state.movies)),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GenreFailure) {
          return const Center(
            child: Text("Failure"),
          );
        }
        return Center(
          child: Text("Unkown Error  $state"),
        );
      },
    ));
  }
}
