// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  String subtitle;
  Widget leading;

  CustomAppBar(
      {super.key,
      required this.leading,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        SizedBox(
          width: 300,
          child: ListTile(

              title: Text(title, style: MyTextStyle.textStyle_26()),
              subtitle: Text(subtitle, style: MyTextStyle.textStyle_20())),
        ),
        leading
      ],
    );
  }
}
