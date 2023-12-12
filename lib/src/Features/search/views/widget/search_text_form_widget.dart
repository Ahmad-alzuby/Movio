import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movio/src/Features/search/controller/searchPerson/search_cubit.dart';
import 'package:movio/src/core/consts/colors.dart';

class MovieTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;

  const MovieTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        onChanged: (value) {
          String textValue = value;
          BlocProvider.of<SearchCubit>(context).search(textValue);
        },
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).primaryColor,
          ),
          filled: true,
          fillColor: MyColor.formColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
