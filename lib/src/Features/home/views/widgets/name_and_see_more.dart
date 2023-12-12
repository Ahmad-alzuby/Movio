// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class NameAndSeeMoreWidget extends StatelessWidget {
  String title;
  void Function() onTap;
  NameAndSeeMoreWidget({
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textAlign: TextAlign.start,
          title,
          style: MyTextStyle.textStyle_24(),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textAlign: TextAlign.start,
            'view all',
            style: MyTextStyle.textStyle_22().copyWith(color: Colors.blue[700]),
          ),
        ),
      ],
    );
  }
}
