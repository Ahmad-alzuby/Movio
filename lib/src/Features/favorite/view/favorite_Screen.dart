// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movio/src/Features/favorite/manger/favorite_cubit.dart';
import 'package:movio/src/Features/favorite/widget/no_favorite_gridview.dart';
import 'package:movio/src/Features/favorite/widget/no_favorite_widget.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/core/consts/colors.dart';
import 'package:movio/src/core/consts/consts.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatefulWidget {
  int? index;
  FavoriteScreen({super.key, @required this.index});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.primeryColor,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Expanded(
                child: BlocProvider(
                    create: (context) => FavoriteCubit(),
                    child: BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                      Hive.box<MovieModel>(kfavoriteBox)
                          .watch()
                          .listen((event) {
                        setState(() {});
                      });
                      return Hive.box<MovieModel>(kfavoriteBox).length == 0 ||
                              state is EmptyList
                          ? const Expanded(child: NoFavoriteWidget())
                          : GridView.builder(
                              itemCount:
                                  Hive.box<MovieModel>(kfavoriteBox).length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .height *
                                          1 /
                                          MediaQuery.of(context).size.height *
                                          0.8,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return FavoriteMovieGridView(
                                    context: context,
                                    index: index,
                                    movieModel:
                                        Hive.box<MovieModel>(kfavoriteBox)
                                            .values
                                            .toList());
                              },
                            );
                    })))
          ]),
        ));
  }
}
