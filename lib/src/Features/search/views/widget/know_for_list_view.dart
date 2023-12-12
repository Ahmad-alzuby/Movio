
import 'package:flutter/material.dart';
import 'package:movio/src/Features/search/models/artists/artistsmodel.dart';
import 'package:movio/src/Features/search/views/widget/know_for_widget.dart';

class KnowForListView extends StatelessWidget {
  const KnowForListView({
    super.key,
    required this.artist,
  });

  final Artists artist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: artist.knownFor?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return KnowForWidget(artist: artist , index : index);
          }),
    );
  }
}