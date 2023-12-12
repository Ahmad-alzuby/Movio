
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/Genre/cubit/genre_cubit.dart';
import 'package:movio/src/Features/home/controller/cubit/home_cubit.dart';
import 'package:movio/src/Features/home/views/widgets/action_list_view.dart';
import 'package:movio/src/Features/search/controller/topArtists/cubit/top_artists_cubit.dart';
import 'package:movio/src/Features/search/views/widget/best_artists_list_view.dart';
import 'package:movio/src/Features/search/views/widget/best_genre_list_view.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class SearchBodyWidget extends StatelessWidget {
  const SearchBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                "Best Genre",
                style: MyTextStyle.textStyle_24(),
              ),
              const SizedBox(
                height: 10,
              ),
                BlocProvider(
                create: (context) => GenreCubit()..getGenre(),
                child: const BestGenreListViewWidget(),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Best Artists",
                style: MyTextStyle.textStyle_24(),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocProvider(
                create: (context) => TopArtistsCubit()
                  ..getTopArtists(),
                child: const BestArtistsListView(),
              ),
             
              BlocProvider(
                create: (context) =>
                    HomeCubit()..getpopulerMovies(),
                child:
                      MoviesListViewHorizantl(title: 'Top Movies'),
              ),
            ],
          ),
        ),
      );
  }
}
