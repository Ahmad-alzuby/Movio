
import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/views/widgets/skeelton_widget.dart';

class HoriontalListViewWidgetShimmer extends StatelessWidget {
  const HoriontalListViewWidgetShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SkeltoonWidget(height: 0.11, width: 0.3),
              const SizedBox(
                height: 10,
              ),
              SkeltoonWidget(height: 0.01, width: 0.3),
              const SizedBox(
                height: 10,
              ),
              SkeltoonWidget(height: 0.01, width: 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
