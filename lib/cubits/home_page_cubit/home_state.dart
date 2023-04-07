part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeAdding extends HomeState {}
class HomeSuccess extends HomeState {List<Widget> noteListo ;
HomeSuccess( {required this.noteListo});
}
