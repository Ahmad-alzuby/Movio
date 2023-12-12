// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/Features/details/views/widget/details_body_widget.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/core/consts/colors.dart';
// Import statements...
// Import statements...

class DetailsView extends StatelessWidget {
  final MovieModel movies;

  const DetailsView({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.primeryColor,
      body: DetailsViewBodyWidget(movies: movies),
    );
  }
}

