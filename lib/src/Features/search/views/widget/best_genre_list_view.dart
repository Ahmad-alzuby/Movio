import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/Genre/cubit/genre_cubit.dart';
import 'package:movio/src/Features/home/views/widgets/skeelton_widget.dart';
import 'package:movio/src/Features/search/views/widget/best_genre_widget.dart';
import 'package:movio/src/core/appRouter/router_name.dart';

class BestGenreListViewWidget extends StatelessWidget {
  const BestGenreListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: BlocBuilder<GenreCubit, GenreState>(
        builder: (context, state) {
          if (state is GenreSuccses) {
            return ListView.builder(
              itemCount: state.genre.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => 
             InkWell(
                    onTap: () {
                      GoRouter.of(context).push(RouterName.genreMovies , extra:  state.genre[index]);
                    },
                    child:
                        BestGenreWidget(text: state.genre[index].genreName)),
              
            );
          } else if (state is GenreLoading) {
            return ListView.builder(
                itemCount: 20,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SkeltoonWidget(height: 0.9, width: 0.35),
                    ));
          }
          return const Center(
            child: Text("There Is No Genre Yet"),
          );
        },
      ),
    );
  }
}
