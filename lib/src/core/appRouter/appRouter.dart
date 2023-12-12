// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/Genre/cubit/genre_cubit.dart';
import 'package:movio/src/Features/Genre/models/genre/genremodel.dart';
import 'package:movio/src/Features/Genre/views/movies_genre_view.dart';
import 'package:movio/src/Features/details/views/details_view.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/home/views/home_view.dart';
import 'package:movio/src/Features/moreMovies/view/more_movies_view.dart';
import 'package:movio/src/Features/search/models/artists/artistsmodel.dart';
import 'package:movio/src/Features/search/views/artists_detials_view.dart';
import 'package:movio/src/Features/search/views/search_%20view.dart';
import 'package:movio/src/Features/search/views/top_artists_view.dart';
import 'package:movio/src/Features/splash/view/splash_view.dart';
import 'package:movio/src/core/appRouter/router_name.dart';

abstract class AppRouter {
  static final routr = GoRouter(routes: [
     GoRoute(
      path: '/',
      builder: (context, state) => const     MyCustomSplashScreen(),
 
    ),
    GoRoute(
      path: RouterName.homeview,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RouterName.detialsView,
      builder: (context, state) =>
          DetailsView(movies: state.extra as MovieModel),
    ),
    GoRoute(
      path: RouterName.searchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: RouterName.resultSearch,
      builder: (context, state) => const SearchResultView(),
    ),
    GoRoute(
      path: RouterName.artistsDetailsView,
      builder: (context, state) =>
          TopArtistDetailsView(artist: state.extra as Artists),
    ),
    GoRoute(
      path: RouterName.viewAllMovies,

      builder: (context, state) => MoreMoviesView(moviesId: state.extra as int,
        
      ),
    ),
    GoRoute(
      path: RouterName.genreMovies,
      
      builder: (context, state) =>   BlocProvider(


        

        create: (context) {
          GenreModel genreModel = state.extra as GenreModel;
         return GenreCubit()..getMoviesBygenre(genreModel.id);},
        child:   MoviesGenreView(genreModel: state.extra as GenreModel),
      ),
    )
  ]);
}
