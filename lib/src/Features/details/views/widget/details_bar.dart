// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class DetailsBarWidget extends StatelessWidget {
  String rating;
  String countRating;
  DetailsBarWidget(
      {super.key, required this.rating, required this.countRating});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: MyTextStyle.textStyle_20(),
      trailing: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.yellow,
                ),
                Text(
                  rating,
                  style:
                      MyTextStyle.textStyle_18().copyWith(color: Colors.yellow),
                ),
              ],
            ),
            Text("($countRating)")
          ],
        ),
      ),
      title: const Text("First Man"),
      leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          )),
    );
  }
}
