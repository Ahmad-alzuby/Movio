import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/Genre/cubit/genre_cubit.dart';
import 'package:movio/src/Features/home/controller/cubit/home_cubit.dart';
import 'package:movio/src/Features/home/views/widgets/home_view_body.dart';
import 'package:movio/src/Features/presentation/view/favorite_Screen.dart';
import 'package:movio/src/Features/search/views/search_%20view.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavitState> {
  int currenPageNumber = 0;

  NavigatorCubit() : super(SearchInitial());

  List<Widget> pages = [
         BlocProvider(
      create: (context) => HomeCubit()..getpopulerMovies(),
      child: const HomeViewBody(),
    ),
    FavoriteScreen(index: 0)
,
    BlocProvider(
      create: (context) => GenreCubit()..getGenre(),
      child: const SearchView()),
 
  ];
  changePage(int index) {
    currenPageNumber = index;
    emit(Changepage(index: index));
  }
}
