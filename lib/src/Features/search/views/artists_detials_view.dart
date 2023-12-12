// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/search/models/artists/artistsmodel.dart';
import 'package:movio/src/Features/search/views/widget/artis_info.dart';
import 'package:movio/src/Features/search/views/widget/know_for_list_view.dart';
import 'package:movio/src/core/consts/colors.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class TopArtistDetailsView extends StatelessWidget {
  Artists artist;
  TopArtistDetailsView({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Expanded(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  artist.profilePath != null
                      ? "https://image.tmdb.org/t/p/w500${artist.profilePath}"
                      : "https://www.cmu.edu/chemistry/people/staff/images/no-image.png",
                  fit: BoxFit.fill,
                ),
              )),
            ),
            Container(
              height: 20,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 160,
                      blurRadius: 100,
                      color: MyColor.primeryColor),
                ],
              ),
            ),
            Center(
              child: Text(
                "${artist.originalName}",
                style: MyTextStyle.textStyle_36(),
              ),
            ),
            ArtisInfo(artist: artist),
            Text(
              'knownFor',
              style: MyTextStyle.textStyle_24(),
            ),
            const SizedBox(
              height: 20,
            ),
            KnowForListView(artist: artist)
          ],
        ),
      ),
    );
  }
}
