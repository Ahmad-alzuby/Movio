
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movio/src/core/consts/colors.dart';

class NoFavoriteWidget extends StatelessWidget {
  const NoFavoriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: MyColor.primeryColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: Lottie.asset("assets/images/noFavorite.json" ,height: MediaQuery.of(context).size.height * 0.2 , fit: BoxFit.fill), )
      
          ],
        ),
    );
  }
}