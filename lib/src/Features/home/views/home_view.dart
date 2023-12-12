import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/navBar/controller/searchPerson/navigator_cubit.dart';
import 'package:movio/src/Features/navBar/nav_bar_widget.dart';
import 'package:movio/src/core/consts/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: MyColor.primeryColor,
            body: BlocProvider<NavigatorCubit>(
              create: (context) => NavigatorCubit()..changePage(0),
              child: BlocBuilder<NavigatorCubit, NavitState>(
                  builder: (context, state) {
                if (state is Changepage) {
                  return Scaffold(
                      backgroundColor: MyColor.primeryColor,
                      body: context.read<NavigatorCubit>().pages[state.index],
                      bottomNavigationBar: const NavigatorWidget());
                } else {
                  context.read<NavigatorCubit>().currenPageNumber = 0;
                  return const Scaffold(
                  
                  );
                }
              }),
            )));
  }
}
