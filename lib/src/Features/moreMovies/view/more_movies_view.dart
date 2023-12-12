// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/moreMovies/controller/cubit/more_view_cubit.dart';
import 'package:movio/src/Features/moreMovies/view/widgets/grid_view_widget.dart';
import 'package:movio/src/core/consts/colors.dart';

class MoreMoviesView extends StatelessWidget {
 
   int moviesId;
    MoreMoviesView({super.key , required this.moviesId});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
    backgroundColor: MyColor.primeryColor,
      body: BlocProvider(
      create: (context) => MoreViewCuibt()..getMoreMovie(moviesId.toString()),
      child:   MoreMovieGridView(id: moviesId.toString()  )),);
  }
}