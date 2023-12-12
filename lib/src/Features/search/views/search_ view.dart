// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movio/src/Features/details/views/widget/check_heart_color.dart';
import 'package:movio/src/Features/home/views/widgets/app_bar.dart';
import 'package:movio/src/Features/home/views/widgets/movie_widget.dart';
import 'package:movio/src/Features/search/controller/searchPerson/search_cubit.dart';
import 'package:movio/src/Features/search/views/widget/search_body.dart';
import 'package:movio/src/Features/search/views/widget/search_text_form_widget.dart';
import 'package:movio/src/Features/search/views/widget/search_widget_loading.dart';
import 'package:movio/src/core/appRouter/router_name.dart';
import 'package:movio/src/core/consts/colors.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.primeryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocProvider(
            create: (context) => SearchCubit(),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return Center(
                  child: Column(
                    children: [
                      CustomAppBar(
                          leading:  const Text(''),
                          title: 'Search',
                          subtitle: "Moer Then 3 Million Movie"),
                      const MovieTextField(
                          hintText: 'Serarch',
                          prefixIcon: Icons.search_outlined),
                      state is SearchLoadded
                          ? Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: state.movies.length,
                              itemBuilder: (context, index) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    GoRouter.of(context).push(
                                        RouterName.detialsView,
                                        extra: state.movies[index]);
                                  },
                                  child: ListTile(
                                    title: Text(
                                        overflow: TextOverflow.ellipsis,
                                        state.movies[index].title!),
                                    subtitle: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                            overflow: TextOverflow.ellipsis,
                                            state.movies[index].voteAverage
                                                .toString()),
                                      ],
                                    ),
                                    trailing: ChechHeartColor(
                                        movies: state.movies[index]),
                                    leading: SizedBox(
                                      child: MoviePosters(
                                          image: state.movies[index]
                                                      .posterPath !=
                                                  null
                                              ? "https://image.tmdb.org/t/p/w500${state.movies[index].posterPath}"
                                              : "https://www.cmu.edu/chemistry/people/staff/images/no-image.png",
                                          height: 0.1,
                                          width: 0.2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          : state is SearchInitial
                              ? const SearchBodyWidget()
                              :  const SearchWidgetLoading()
                                
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
