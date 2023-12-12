import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movio/src/Features/home/models/movie_model.dart';
import 'package:movio/src/Features/navBar/controller/searchPerson/navigator_cubit.dart';
import 'package:movio/src/core/appRouter/appRouter.dart';
import 'package:movio/src/core/consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());

  await Hive.openBox<MovieModel>(kfavoriteBox);
  return runApp(const Movio());
}

class Movio extends StatelessWidget {
  const Movio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigatorCubit(),
      child: MaterialApp.router(

          color: Colors.red,
          theme: ThemeData.dark(),
       
          routerConfig: AppRouter.routr,
          debugShowCheckedModeBanner: false),
    );
  }
}
