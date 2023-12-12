
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeltoonWidget extends StatelessWidget {
  double width;
  double height;
  SkeltoonWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 138, 138, 138),
      highlightColor: const Color.fromARGB(255, 255, 255, 255),
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * height,
        decoration: BoxDecoration(
            color: const Color.fromARGB(212, 132, 132, 132),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
