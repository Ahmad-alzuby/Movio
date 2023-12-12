// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MoviePosters extends StatelessWidget {
  double height;
  double width;
  String image;
  MoviePosters({
    required this.image,
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(30, 254, 254, 254),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
