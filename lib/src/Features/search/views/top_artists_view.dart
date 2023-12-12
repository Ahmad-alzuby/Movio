import 'package:flutter/material.dart';

import 'package:movio/src/Features/home/views/widgets/app_bar.dart';

import 'package:movio/src/Features/search/views/widget/search_text_form_widget.dart';
import 'package:movio/src/core/consts/colors.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.primeryColor,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(children: [
              CustomAppBar(
                  leading: const CircleAvatar(),
                  title: 'Search',
                  subtitle: "Moer Then 3 Million Movie"),
              const MovieTextField(
                  hintText: 'Serarch', prefixIcon: Icons.search_outlined),
            ])));
  }
}
