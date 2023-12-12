// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movio/src/Features/navBar/controller/searchPerson/navigator_cubit.dart';
import 'package:movio/src/core/consts/colors.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({super.key});

  @override
  _NavigatorWidgetState createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColor.primeryColor,
        boxShadow: [],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            rippleColor: MyColor.formColor,
            hoverColor: MyColor.formColor,
            gap: 8,
            activeColor: const Color.fromARGB(211, 204, 204, 204),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: MyColor.formColor,
            color: const Color.fromARGB(255, 152, 152, 152),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                context.read<NavigatorCubit>().changePage(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
