part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState{}

class HomeLoaded extends HomeState{
  final List<BookModel> booklist;
  HomeLoaded({
    required this.booklist
  });
}

class HomeError extends HomeState{
  final String messge;
  HomeError({
    required this.messge
  });
}
