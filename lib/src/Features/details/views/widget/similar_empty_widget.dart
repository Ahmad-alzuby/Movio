import 'package:flutter/material.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class SimilarEmptyWidget extends StatelessWidget {
  const SimilarEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "No Similar Movies",
              style: MyTextStyle.textStyle_18(),
            ),
          ],
        ),
      ],
    );
  }
}
