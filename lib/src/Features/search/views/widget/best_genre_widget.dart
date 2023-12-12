// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/core/consts/colors.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class BestGenreWidget extends StatelessWidget {
  String text;

  BestGenreWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: MyColor.formColor,
      ),
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Center(
        child: Text(
          text,
          style: MyTextStyle.textStyle_22(),
        ),
      ),
    );
  }
}
