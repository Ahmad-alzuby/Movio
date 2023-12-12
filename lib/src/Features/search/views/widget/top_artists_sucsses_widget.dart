// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/home/views/widgets/movie_widget.dart';
import 'package:movio/src/Features/search/controller/topArtists/cubit/top_artists_cubit.dart';
import 'package:movio/src/core/appRouter/router_name.dart';
import 'package:movio/src/core/stryles/text_style.dart';

class TopArtistsSucssesStateWidget extends StatelessWidget {
  TopArtistsSucsses state;
  TopArtistsSucssesStateWidget({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.artists.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(RouterName.artistsDetailsView, extra: state.artists[index]);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.26,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Hero(
                  tag: state.artists[index].id ?? 0,
                  child: MoviePosters(
                      image: state.artists[index].profilePath != null
                          ? "https://image.tmdb.org/t/p/w500${state.artists[index].profilePath}"
                          : "https://www.cmu.edu/chemistry/people/staff/images/no-image.png",
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.2),
                ),
              ),
              Text(
                state.artists[index].name!,
                style: MyTextStyle.textStyle_14(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
