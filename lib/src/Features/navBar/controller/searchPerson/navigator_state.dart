part of 'navigator_cubit.dart';

@immutable
sealed class NavitState{}

final class SearchInitial extends NavitState {}
// ignore: must_be_immutable
final class Changepage extends NavitState {
  int index ;
  Changepage({required this.index});
}

 