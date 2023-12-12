import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/home/views/widgets/horziantl_list_view_shimmer.dart';
import 'package:movio/src/Features/search/controller/topArtists/cubit/top_artists_cubit.dart';
import 'package:movio/src/Features/search/views/widget/top_artists_sucsses_widget.dart';

class BestArtistsListView extends StatelessWidget {
  const BestArtistsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width * 0.21,
      child: BlocBuilder<TopArtistsCubit, TopArtistsState>(
        builder: (context, state) {
          if (state is TopArtistsSucsses) {
            return   TopArtistsSucssesStateWidget(state:state);
          }
          else if (state is TopArtistsLoading){
          return const HoriontalListViewWidgetShimmer();
          }
          return const Text('unkown error');
        },
      ),
    );
  }
}

