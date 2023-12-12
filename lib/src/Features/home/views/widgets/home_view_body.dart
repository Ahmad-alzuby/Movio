import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/home/controller/cubit/home_cubit.dart';
import 'package:movio/src/Features/home/views/widgets/action_list_view.dart';
import 'package:movio/src/Features/home/views/widgets/app_bar.dart';
import 'package:movio/src/Features/home/views/widgets/home_body_loading.dart';
import 'package:movio/src/Features/home/views/widgets/move_explor_list_view.dart';
import 'package:movio/src/core/stryles/text_style.dart';
import 'package:svg_flutter/svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccsesState) {
          return Column(children: [
            CustomAppBar(
              title: "Explor..",
              subtitle: "Welcome Back!",
              leading:   Padding(
                padding: const EdgeInsets.only(right: 10),
                child:  SizedBox(
                  width: 70  , 
                  height: 70,
                  child: SvgPicture.asset("assets/images/movelogoblack.svg"))
              )
              
            ),
            MoviesExplorListView(movies: state.movies),
              Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoviesListViewHorizantl(title: "Top Rated"),
            )
          ]);
        } else if (state is HomeLoadingState) {
          return const HomeBodyShimmer();
        } else if (state is HomeFailerState) {
          return Text('error : ${state.errormassge}');
        }
        return const Text("unkwon error");
      },
    );
  }
}
