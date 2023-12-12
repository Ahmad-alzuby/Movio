import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movio/src/Features/home/views/widgets/horziantl_list_view_shimmer.dart';
import 'package:movio/src/Features/home/views/widgets/skeelton_widget.dart';
import 'package:movio/src/core/consts/colors.dart';

class HomeBodyShimmer extends StatelessWidget {
  const HomeBodyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.primeryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SkeltoonWidget(height: 0.02, width: 0.2),
                  const SizedBox(
                    height: 10,
                  ),
                  SkeltoonWidget(height: 0.02, width: 0.3),
                ],
              ),
              SkeltoonWidget(height: 0.03, width: 0.3),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                      viewportFraction: 0.7,
                      height: MediaQuery.of(context).size.height * 0.45,
                      autoPlayCurve: Curves.ease,
                      enlargeCenterPage: true,
                      autoPlay: true),
                  itemCount: 20,
                  itemBuilder: (context, index, realIndex) => ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SkeltoonWidget(
                          height: 0.2,
                          width: 0.7,
                        ),
                      ))),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkeltoonWidget(height: 0.05, width: 0.3),
              SkeltoonWidget(height: 0.05, width: 0.3),
            ],
          ),
          const HoriontalListViewWidgetShimmer(),
        ],
      ),
    );
  }
}
