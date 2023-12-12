import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/home/views/widgets/skeelton_widget.dart';
import 'package:movio/src/Features/moreMovies/controller/cubit/more_view_cubit.dart';
import 'package:movio/src/Features/moreMovies/view/widgets/more_movie_gridview.dart';
import 'package:movio/src/core/consts/colors.dart';

// ignore: must_be_immutable
class MoreMovieGridView extends StatefulWidget {
  String id;
  MoreMovieGridView({
    super.key,
    required this.id,
  });

  @override
  State<MoreMovieGridView> createState() => _MoreMovieGridViewState();
}

class _MoreMovieGridViewState extends State<MoreMovieGridView> {
  ScrollController scrollController = ScrollController();
  bool isloading = true;
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isloading = true;
        context.read<MoreViewCuibt>().getMoreMovies(widget.id.toString());
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.primeryColor,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text("More Movies"),
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<MoreViewCuibt, MoreViewState>(
              builder: (context, state) {
            if (state is MoreViewSuccses) {
              return MoreViewGridView(
                movies: state.movies,
                context: context,
                isLoaidng: isloading,
                scrollController: scrollController,
              );
            }
            if (state is MoreViewLoading) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.height *
                      1 /
                      MediaQuery.of(context).size.height *
                      0.8,
                ),
                itemCount: 20,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SkeltoonWidget(height: 0.19, width: 2),
                      const SizedBox(
                        height: 10,
                      ),
                      SkeltoonWidget(height: 0.02, width: 0.5),
                    ],
                  ),
                ),
              );
            }
            return   Center(
              child: Text("unkwon Error $state"),
            );
          }),
        ));
  }
}

