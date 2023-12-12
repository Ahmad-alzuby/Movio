// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/Features/search/models/artists/artistsmodel.dart';
import 'package:movio/src/core/consts/colors.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class ArtisInfo extends StatelessWidget {
  Artists artist;
  ArtisInfo({
    super.key,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.stars_rounded,
              color: Colors.yellow,
              size: 36,
            ),
            Text(
              artist.popularity!.roundToDouble().toString(),
              style: MyTextStyle.textStyle_22(),
            ),
          ],
        ),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: MyColor.formColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Adult",
                  style: MyTextStyle.textStyle_18(),
                )),
            Text(
              artist.adult == false ? "No" : "Yes",
              style: MyTextStyle.textStyle_18(),
            ),
          ],
        ),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: MyColor.formColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Top",
                  style: MyTextStyle.textStyle_18(),
                )),
            Text(
              artist.knownForDepartment!.toString(),
              style: MyTextStyle.textStyle_18(),
            ),
          ],
        ),
      ],
    );
  }
}
