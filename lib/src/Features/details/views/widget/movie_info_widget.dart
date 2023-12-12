// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/core/consts/colors.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class MovieDetailsInfo extends StatelessWidget {
  String firstTitle;
  String firstValue;
  String secoundValue;
  String secoundTitle;
  MovieDetailsInfo(
      {super.key,
      required this.firstTitle,
      required this.firstValue,
      required this.secoundTitle,
      required this.secoundValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    firstTitle,
                    style: MyTextStyle.textStyle_18()
                        .copyWith(color: MyColor.textColor),
                  ),
                  SizedBox(
                      width: 100,
                      child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          firstValue,
                          style: MyTextStyle.textStyle_14())),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(secoundTitle,
                      style: MyTextStyle.textStyle_18()
                          .copyWith(color: MyColor.textColor)),
                  Text(secoundValue, style: MyTextStyle.textStyle_16()),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
